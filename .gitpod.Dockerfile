FROM gitpod/workspace-full:latest

USER gitpod
RUN python3 -m pip install --upgrade pip
RUN pip3 install Flask==1.0.2 mongoengine   wheel flask-mongoengine
RUN export FLASK_APP="main.py"
RUN mkdir -p /tmp/mongodb && \
    cd /tmp/mongodb && \
    wget -qOmongodb.tgz https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-ubuntu2004-4.4.2.tgz && \
    tar xf mongodb.tgz && \
    cd mongodb-* && \
    sudo cp bin/* /usr/local/bin/ && \
    rm -rf /tmp/mongodb && \
    sudo mkdir -p /data/db && \
    sudo chown gitpod:gitpod -R /data/db

RUN mongod --dbpath /data/db