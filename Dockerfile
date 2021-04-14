FROM ruby:2.6.3-alpine as base
ARG RAILS_ENV

ENV BUILD_PACKAGES="linux-headers tzdata build-base libffi-dev bash sqlite-dev curl less shared-mime-info nodejs"
RUN apk --update --upgrade add $BUILD_PACKAGES && rm /var/cache/apk/*

FROM base as step1

RUN mkdir /app
WORKDIR /app

COPY Gemfile /app
COPY Gemfile.lock /app

ENV BUNDLER_VERSION=2.0.1
ARG BUNDLE_WITHOUT
RUN gem install bundler:${BUNDLER_VERSION} && bundle config --global frozen 1 && bundle _${BUNDLER_VERSION}_ install --jobs=4
COPY . /app

EXPOSE 3000
