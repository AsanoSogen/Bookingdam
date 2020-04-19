# ruby:2.6のDockerイメージをベースとして利用
FROM ruby:2.6.2

RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y mysql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
  
# 作業ディレクトリを/bookingdamに指定
RUN mkdir /bookingdam
WORKDIR /bookingdam

# ローカルのGemfileをDokcerにコピー
COPY Gemfile /bookingdam/Gemfile

# /rails_appディレクトリ上でbundle install
RUN gem install bundler
RUN bundle install


ADD . /bookingdam