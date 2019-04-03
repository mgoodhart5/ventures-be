FROM ruby:2.4.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN gem install bundler --version "2.0.1"
RUN mkdir /ventures-be
WORKDIR /ventures-be
COPY Gemfile /ventures-be/Gemfile
COPY Gemfile.lock /ventures-be/Gemfile.lock
RUN bundle install
COPY . /ventures-be

# Add a script to be executed every time the container starts
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "s", "-b", "0.0.0.0"]
