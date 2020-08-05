FROM ruby:2.5.1

RUN apt-get update -qq && \
    apt-get install -y build-essential \ 
    libpq-dev \
    git \
    vim 

#yarnのインストール
RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn

#Nodejsをバージョン指定してインストール
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
    apt-get install nodejs

RUN mkdir /webapp
WORKDIR /webapp
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn
ENV RAILS_SERVE_STATIC_FILES=true

ADD ./Gemfile /webapp/Gemfile
ADD ./Gemfile.lock /webapp/Gemfile.lock

RUN gem install bundler -v 2.1.4
RUN bundle install
ADD . /webapp
RUN mkdir -p tmp/sockets