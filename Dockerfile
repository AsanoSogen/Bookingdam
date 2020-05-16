# ruby:2.6のDockerイメージをベースとして利用
FROM node:12.16.2 as node
FROM ruby:2.6.2

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y mysql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
  
RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
apt-get update && apt-get install -y yarn

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
    apt-get install -y nodejs

# 作業ディレクトリを/bookingdamに指定
RUN mkdir /Bookingdam

ENV APP_ROOT /Bookingdam
WORKDIR $APP_ROOT

# ローカルのGemfileをDokcerにコピー
COPY ./Gemfile /$APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

# /rails_appディレクトリ上でbundle install
RUN gem install bundler:2.1.4
RUN bundle install

ADD . $APP_ROOT

RUN mkdir -p tmp/sockets