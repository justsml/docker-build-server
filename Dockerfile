# FROM node:6.9
FROM debian:jessie-slim
# FROM debian:8

MAINTAINER Dan Levy <dan@danlevy.net>

LABEL io.elph.meta.author=dan.levy
LABEL io.elph.meta.base_image=elasticsuite/docker-build-server

# Avoid ERROR: invoke-rc.d: policy-rc.d denied execution of start.
RUN echo "#!/bin/sh\nexit 0" > /usr/sbin/policy-rc.d

RUN env | sort
RUN DEBIAN_FRONTEND=noninteractive \
  apt-get update -qq && \
DEBIAN_FRONTEND=noninteractive \
  apt-get install -y --no-install-recommends \
    build-essential apt-utils sudo ca-certificates dialog imagemagick gnupg2 \
    aufs-tools iptables \
    curl rsync git-core apt-transport-https openssl \
    libffi-dev makedev mountall libc6-dev \
    python-software-properties software-properties-common postgresql-9.4 postgresql-client-9.4 postgresql-contrib-9.4
# cgroupfs-mount
# sqlite3 libsqlite3-dev libyaml-dev autoconf automake libtool bison


ENV PATH /usr/local/bin:/usr/bin:/bin:/sbin:/usr/sbin::$PATH
RUN echo 'export PATH="$HOME/.rvm/bin:$HOME/.yarn/bin:/usr/local/bin:$PATH"' >> /etc/profile
RUN curl https://s3.amazonaws.com/pkgr-buildpack-ruby/current/debian-8/ruby-2.1.0.tgz -o - | sudo tar xzf - -C /usr/local
# COPY ./ruby-2.1.0/* /usr/local/
# COPY ./ruby-2.1.0/bin/* /usr/local/bin/
# COPY ./ruby-2.1.0/include/* /usr/local/include/
# COPY ./ruby-2.1.0/lib/* /usr/local/lib/
# COPY ./ruby-2.1.0/share/* /usr/local/share/

## Ruby/bundler stuff
# RUN gem source -r https://rubygems.org/ && \
#     gem source -a http://rubygems.org/ && \
#     gem update --system && \
#     gem source -r http://rubygems.org/ && \
#     gem source -a https://rubygems.org/ && \
# RUN  DEBIAN_FRONTEND=noninteractive \
#         gem install rubygems-update && \
#         update_rubygems && \
WORKDIR /tmp/

USER www-data
RUN DEBIAN_FRONTEND=noninteractive \
     gem install bundler --no-rdoc --no-ri
COPY Gemfile* /root/
RUN bundle install
USER root

# RUN wget -qO- https://get.docker.com/ | sh
RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-1.12.3.tgz && tar --strip-components=1 -xvzf docker-1.12.3.tgz -C /usr/local/bin && chmod +x /usr/local/bin/docker
RUN curl -L "https://github.com/docker/compose/releases/download/1.8.1/docker-compose-$(uname -s)-$(uname -m)" > /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose
# [ "$(which docker-compose)" == "" ] && curl -L "https://github.com/docker/compose/releases/download/1.8.1/docker-compose-$(uname -s)-(uname -m)" > /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose && echo "Downloaded:" && docker-compose --version || echo "Already Installed:" && docker-compose --version'
ENV NVM_DIR=/usr/local/nvm
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
RUN source $NVM_DIR/nvm.sh && nvm install 6 && nvm alias default 6
RUN printf '\n[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"\n' >> /etc/profile
RUN source $NVM_DIR/nvm.sh && \
  npm i -g yarn \
  babel-cli \
  babel-core \
  babel-preset-es2015 \
  gulp-cli \
  less \
  less-plugin-autoprefix \
  less-plugin-clean-css \
  webpack

# RUN echo '*.*          @logs.papertrailapp.com:20634' >> /etc/rsyslog.conf
# docker run --restart=always -d --name logspout-papertrail \
#   -v=/var/run/docker.sock:/var/run/docker.sock gliderlabs/logspout  \
#   syslog://logs.papertrailapp.com:20634
ENTRYPOINT echo "WARN: INHERIT/OVERRIDE THIS DOCKER IMAGE - SET ENTRYPOINT!"
