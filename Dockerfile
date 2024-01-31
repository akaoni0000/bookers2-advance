FROM ruby:2.5.7

RUN apt-get update -qq && apt-get install -y build-essential nodejs vim

RUN mkdir /bookers2-advance
WORKDIR /bookers2-advance

# ホストのGemfileとGemfile.lockをコンテナにコピー
COPY Gemfile /bookers2-advance/Gemfile
COPY Gemfile.lock /bookers2-advance/Gemfile.lock

# bundle installの実行
RUN bundle install

# ホストのアプリケーションディレクトリ内をすべてコンテナにコピー
COPY . /bookers2-advance

# puma.sockを配置するディレクトリを作成
RUN mkdir tmp/sockets