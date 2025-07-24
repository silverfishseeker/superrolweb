FROM ruby:3.1.3

WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .
ENTRYPOINT ["./entrypoint.sh"]
# Puto tmp (hay que borrarlo para evitar errores, ni idea de porqué)
# iniciar rails
CMD rm -rf /app/tmp/* && bin/rails server -b 0.0.0.0 -e production
