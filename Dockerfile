FROM ruby:3.1

WORKDIR /app
COPY ./composition_app/Gemfile /app/Gemfile
COPY ./composition_app/Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY ./composition_app /app

CMD ['rails', 's', '-b', '0.0.0.0']