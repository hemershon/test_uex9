FROM ruby:3.3.3

RUN apt-get update -qq && apt-get install -y nodejs

RUN gem install bundler -v 2.2.33

RUN mkdir -p tmp/pids


RUN mkdir /app

WORKDIR /app

COPY entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

COPY app/Gemfile /app/Gemfile
COPY app/Gemfile.lock /app/Gemfile.lock

RUN bundle config build.nokogiri --use-system-libraries

RUN bundle check || bundle install

COPY app /app

EXPOSE 3000

ENTRYPOINT ["entrypoint.sh"]

CMD [ "bundle", "exec", "puma", "-C", "config/puma.rb"]