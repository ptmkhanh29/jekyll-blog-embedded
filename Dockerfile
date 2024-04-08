# Dockerfile for setting up a Jekyll project environment
# To build an image with a custom user, use:
#      docker build --build-arg DOCKER_USER=<username> -t <tagname> .

# Manual setup instructions:
# 1. Environment setup:
#    - Install Ruby and dependencies:
#         sudo apt-get install ruby-full build-essential zlib1g-dev -y
#    - Configure environment variables:
#         echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
#         echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
#         source ~/.bashrc
#    - Install Jekyll and Bundler:
#         gem install jekyll bundler

# 2. Project build:
#    - Install dependencies: bundle install
#    - Serve site locally: bundle exec jekyll serve


ARG DOCKER_USER=default_user

# Stage 1: jekyll
FROM ruby:3.3.0-slim-bullseye as jekyll   # Namming this stage "jekyll"

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    nodejs \
    && rm -rf /var/lib/apt/lists/*

ENV GEM_HOME="/home/$DOCKER_USER/gems"
ENV PATH="/home/$DOCKER_USER/gems/bin:$PATH"

# Install Jekyll and Bundler
RUN gem install jekyll bundler && gem update --system

# Set the working directory
WORKDIR /home/$DOCKER_USER/projects/jekll-blog-embedded

# Copy the project's Gemfile and Gemfile.lock
COPY Gemfile* ./

# Install project dependencies
RUN bundle install

EXPOSE 4000