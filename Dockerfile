FROM ruby:2.6.5

ENV RAILS_ROOT /drinksmb

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo 'deb http://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list

RUN apt-get update && \
  apt-get install -y \
  nodejs \
  yarn \
  libpq-dev && \
  mkdir -p $RAILS_ROOT && \
  apt-get clean autoclean && \
  apt-get autoremove -y && \
  rm -rf /var/lib/apt /var/lib/dpkg /var/lib/cache /var/lib/log


WORKDIR $RAILS_ROOT

ENV RAILS_ENV='production'
ENV SECRET_KEY_BASE='6523b348fb9cefb4560f3666c7192e95f15dbcb427c42b9b4244917a34fa7a6f5930037c209d3e2b98fbf855151047b0aaae32d9f5a7cfcf6a6d1a7b7c79114f'

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN bundle install --jobs 20 --retry 5 --without development test

COPY package.json package.json
COPY yarn.lock yarn.lock

RUN yarn install --check-files

COPY . .

RUN bundle exec rails assets:precompile