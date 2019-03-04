FROM centos:7
ENV DSS_VERSION="5.0.4" \
    DSS_DATADIR="/home/dataiku/dss" \
    DSS_PORT=12000
# Dataiku account and data dir setup
RUN useradd -s /bin/bash dataiku  \
    && mkdir -p /home/dataiku ${DSS_DATADIR} \
    && chown -Rh dataiku:dataiku /home/dataiku ${DSS_DATADIR}
#RUN echo "dataiku:dataiku" | chpasswd
# System dependencies
# TODO - much could be removed by building externally the required R packages
RUN yum -y update  \
   && yum -y install wget bzip2 ca-certificates \
    libglib2.0-0 libxext6 libsm6 libxrender1 \
    git mercurial subversion
 
#COPY dataiku-dss-4.2.2.tar.gz /home/dataiku
# Download and extract DSS kit
RUN DSSKIT="dataiku-dss-$DSS_VERSION" \
    && cd /home/dataiku \
    && echo "+ Downloading kit" \
    && wget -O $DSSKIT.tar.gz  "https://downloads.dataiku.com/public/studio/$DSS_VERSION/$DSSKIT.tar.gz" \
    && echo "+ Extracting kit" \
    && tar xf "$DSSKIT.tar.gz" \
    && rm "$DSSKIT.tar.gz" \
    && echo "+ Compiling Python code" \
    && python2.7 -m compileall -q "$DSSKIT"/python "$DSSKIT"/dku-jupyter \
    && { python2.7 -m compileall -q "$DSSKIT"/python.packages >/dev/null || true; } \
    && chown -Rh dataiku:dataiku "$DSSKIT"
    
#Install
RUN  cd /home/dataiku \
     && curl -O  "http://www-eu.apache.org/dist/kafka/2.1.0/kafka_2.12-2.1.0.tgz" \
     && tar xzf "kafka_2.12-2.1.0.tgz" -C /opt
RUN  cd /home/dataiku \
    && curl -O "https://repo.anaconda.com/archive/Anaconda3-5.3.1-Linux-x86_64.sh"
RUN yum -y install epel-release
RUN yum -y install R
RUN yum -y install nginx
RUN yum -y install libcurl-devel
RUN yum -y install openssl-devel
RUN yum -y install libxml2-devel
RUN yum -y install zeromq-devel
# Install required R packages
RUN R --slave --no-restore \
    -e "install.packages(c('httr', 'RJSONIO', 'dplyr', 'IRkernel', 'sparklyr', 'ggplot2', 'gtools', 'tidyr', 'rmarkdown'), \
                        repos=c('file:///home/dataiku/dataiku-dss-$DSS_VERSION/dku-jupyter/R', \
                                'https://cloud.r-project.org'))"
# Entry point
WORKDIR /home/dataiku
USER dataiku
RUN wget https://raw.githubusercontent.com/dataiku/dataiku-tools/master/dss-docker/run.sh
RUN chmod a+x run.sh
#COPY run.sh /home/dataiku/
#RUN chmod a+x run.sh
EXPOSE $DSS_PORT
#ENTRYPOINT ["sh", "/home/dataiku/Anaconda3-5.3.1-Linux-x86_64.sh"]
CMD [ "sh","/home/dataiku/run.sh" ]
