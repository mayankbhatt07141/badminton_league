FROM ruby:3.2.2-slim

WORKDIR /rails

# Install dependencies (build-essential for native gems)
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    sqlite3 \
    libsqlite3-dev \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Copy Gemfiles and install gems
COPY Gemfile ./
RUN bundle install

# Copy app
COPY . .

EXPOSE 3000
CMD ["sh", "-c", "bundle exec rails db:prepare && bundle exec rails server -b 0.0.0.0 -p 3000"]
