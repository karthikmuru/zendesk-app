FROM ruby:3.0.2-alpine

RUN apk update

RUN apk add --update --virtual \
  build-dependencies \
  build-base \
  tzdata \
  yarn \
  nodejs

WORKDIR /app
COPY app/ .

ENV BUNDLE_PATH /gems
RUN yarn install
RUN bundle install
RUN bundle exec rails webpacker:install

ENTRYPOINT ["bin/rails"]
CMD ["s", "-b", "0.0.0.0"]
EXPOSE 3000