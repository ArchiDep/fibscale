FROM ruby:3.4.7-alpine

WORKDIR /usr/src/app

# Throw errors if Gemfile has been modified since Gemfile.lock was last updated.
RUN addgroup -S fibscale && \
  adduser -D -G fibscale -S fibscale && \
  chown fibscale:fibscale /usr/src/app

COPY --chown=fibscale:fibscal Gemfile Gemfile.lock ./
RUN apk add --no-cache --virtual .build-deps g++ git make && \
  bundle config --global frozen 1 && \
  bundle install && \
  apk del .build-deps

COPY . ./

CMD ["bundle", "exec", "ruby", "fibscale.rb"]

EXPOSE 3000
