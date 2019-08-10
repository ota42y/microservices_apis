FROM ruby:2.6.3

RUN gem i bundler

RUN mkdir /app
WORKDIR /app

ADD . .
RUN bundle install
