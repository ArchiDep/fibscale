# Builder image
# =============
FROM ruby:3.4.7-alpine AS builder

WORKDIR /fibscale

RUN apk add --no-cache g++ git make && \
    addgroup -S fibscale && \
    adduser -D -G fibscale -S fibscale && \
    chown fibscale:fibscale /fibscale

COPY --chown=fibscale:fibscal Gemfile Gemfile.lock ./

USER fibscale:fibscale

RUN bundle config --global frozen 1 && \
    bundle config set --local deployment 'true' && \
    bundle install

COPY --chown=fibscale:fibscale ./ ./

# Final image
# ===========
FROM ruby:3.4.7-alpine

WORKDIR /fibscale

RUN addgroup -S fibscale && \
    adduser -D -G fibscale -S fibscale && \
    chown fibscale:fibscale /fibscale && \
    bundle config set --local deployment 'true'

COPY --chown=fibscale:fibscale --from=builder /fibscale/ ./

USER fibscale:fibscale

CMD ["bundle", "exec", "ruby", "fibscale.rb"]

EXPOSE 3000
