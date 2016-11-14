FROM node:6.9

MAINTAINER Dan Levy <dan@danlevy.net>

RUN apt-get update -qq && apt-get install -y --no-install-recommends \
  build-essential imagemagick gnupg2 \
  libav-tools wget curl rsync git-core apt-transport-https openssl sqlite3 libsqlite3-dev \
  libyaml-dev autoconf automake libtool bison libffi-dev

## Ruby
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

RUN curl -L https://get.rvm.io | bash -s stable --rails
# Set env just in case
# ENV PATH /usr/local/rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN /bin/bash -l -c "rvm requirements && rvm install 2.1.1 && gem install bundler --no-ri --no-rdoc"

wget -qO- https://get.docker.com/ | sh

ENTRYPOINT echo "WARN: INHERIT/OVERRIDE THIS DOCKER IMAGE - SET ENTRYPOINT!"

