# FROM node:6.9
FROM debian:jessie-slim
# FROM debian:8

MAINTAINER Dan Levy <dan@danlevy.net>

LABEL io.elph.meta.author=dan.levy \
      io.elph.meta.base_image=elasticsuite/docker-build-server

ENV PATH="/vendor/bundle/ruby/2.1.0/bin:/app/vendor/bundle/ruby/2.1.0/bin:$HOME/.rvm/bin:$HOME/.yarn/bin:/usr/local/bin:/usr/bin:/bin:/sbin:/usr/sbin:$PATH" \
    DOCKER_OPTS="--mtu 1400" \
    NVM_DIR=/usr/local/nvm

# # FOR POSTGRES: Avoid ERROR: invoke-rc.d: policy-rc.d denied execution of start.
# RUN echo "#!/bin/sh\nexit 0" > /usr/sbin/policy-rc.d
# RUN echo "#!/bin/sh\nexit 0" > /usr/sbin/update-alternatives
RUN mkdir /usr/share/man/man1 && mkdir /usr/share/man/man7 && \
    apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends \
    build-essential apt-utils sudo ca-certificates dialog imagemagick gnupg2 \
    aufs-tools iptables libmagickwand-dev \
    curl rsync git-core apt-transport-https openssh-client \
    python-software-properties software-properties-common postgresql-9.4 postgresql-client-9.4 postgresql-contrib-9.4 libpq-dev
    # libffi-dev libc6-dev \
# cgroupfs-mount
# sqlite3 libsqlite3-dev libyaml-dev autoconf automake libtool bison
### postgresql-server-dev-9.4
COPY Gemfile* /tmp/
COPY ruby-2.1.0.tgz /app/ruby-2.1.0.tgz
RUN printf 'export PATH="/vendor/bundle/ruby/2.1.0/bin:/app/vendor/bundle/ruby/2.1.0/bin:$HOME/.rvm/bin:$HOME/.yarn/bin:/usr/local/bin:$PATH"\n \n[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"\n ' >> /etc/profile && \
    sudo tar -xvf /app/ruby-2.1.0.tgz -C /usr/local

# USER www-data
WORKDIR /tmp
RUN DEBIAN_FRONTEND=noninteractive \
     gem install bundler --no-rdoc --no-ri && \
     bundle install --deployment --jobs 4  && \
     rsync -ar vendor / && \
     printf '\n#################\nGEM DEBUG INFO\n##############\n\n' && \
     bundle exec gem environment && \
     printf '\n#################\nRAILS PKG LOCATIONS\n##############\n\n' && \
     bundle exec gem which rails railties rack  2>/dev/null
WORKDIR /app
# USER root
### Install docker binary ###
RUN curl --insecure -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-1.12.3.tgz && \
    tar --strip-components=1 -xvzf docker-1.12.3.tgz -C /usr/local/bin && \
    chmod +x /usr/local/bin/docker && \
    ### Same deal, install docker-compose ###
    curl --insecure -L "https://github.com/docker/compose/releases/download/1.8.1/docker-compose-$(uname -s)-$(uname -m)" > /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
    ### Now Node/Npm/NVM
    curl --insecure -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash && \
    /bin/bash -c "source $NVM_DIR/nvm.sh && nvm install 6 && nvm alias default 6 && \
  npm i -g yarn \
  babel-cli \
  babel-core \
  babel-preset-es2015 \
  gulp-cli \
  less \
  less-plugin-autoprefix \
  less-plugin-clean-css \
  webpack"

# RUN echo '*.*          @logs.papertrailapp.com:20634' >> /etc/rsyslog.conf
# docker run --restart=always -d --name logspout-papertrail \
#   -v=/var/run/docker.sock:/var/run/docker.sock gliderlabs/logspout  \
#   syslog://logs.papertrailapp.com:20634
RUN echo "WARN: INHERIT/OVERRIDE THIS DOCKER IMAGE - SET ENTRYPOINT!"
