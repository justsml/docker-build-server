FROM node:6.9

MAINTAINER Dan Levy <dan@danlevy.net>

LABEL io.elph.meta.author=dan.levy
LABEL io.elph.meta.base_image=elasticsuite/docker-build-server
RUN npm i -g yarn \
  babel-cli \
  babel-core \
  babel-preset-es2015 \
  gulp-cli \
  less \
  less-plugin-autoprefix \
  less-plugin-clean-css \
  webpack


RUN apt-get update -qq && apt-get install -y --no-install-recommends \
  sudo build-essential imagemagick gnupg2 aufs-tools cgroupfs-mount iptables \
  libav-tools wget curl rsync git-core apt-transport-https openssl sqlite3 libsqlite3-dev \
  libyaml-dev autoconf automake libtool bison libffi-dev makedev mountall

## Ruby
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 && \
    curl -L https://get.rvm.io | bash -s stable --rails && \
    /bin/bash -l -c "rvm requirements && rvm install 2.1.1 && gem install bundler --no-ri --no-rdoc"

# RUN wget -qO- https://get.docker.com/ | sh
RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-1.12.3.tgz && tar --strip-components=1 -xvzf docker-1.12.3.tgz -C /usr/local/bin && chmod gou+x /usr/local/bin/docker
RUN curl -L "https://github.com/docker/compose/releases/download/1.8.1/docker-compose-$(uname -s)-$(uname -m)" > /usr/local/bin/docker-compose && chmod gou+x /usr/local/bin/docker-compose
# /bin/bash -c '[ "$(which docker-compose)" == "" ] && curl -L "https://github.com/docker/compose/releases/download/1.8.1/docker-compose-$(uname -s)-$(uname -m)" > /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose && echo "Downloaded:" && docker-compose --version || echo "Already Installed:" && docker-compose --version'

RUN echo 'export PATH="$PATH:$HOME/.yarn/bin"' >> /etc/profile

# RUN echo 'export PATH="$$PATH:$$HOME/.yarn/bin"' >> /root/.bashrc

ENTRYPOINT echo "WARN: INHERIT/OVERRIDE THIS DOCKER IMAGE - SET ENTRYPOINT!"
