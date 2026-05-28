FROM phusion/passenger-ruby40

#libsodium
#RUN apt-get update && apt-get install libsodium-dev -y
# install ffpmepg
#RUN apt-get update && apt-get install -y ffmpeg

RUN curl -sL https://deb.nodesource.com/setup_22.x | bash 
RUN apt-get install -y nodejs

#RUN apt-get update && apt-get install -y tzdata && apt-get install imagemagick -y

# RUN apt-get update && apt-get install -y \
#     ca-certificates \
#     openssl \
#     && rm -rf /var/lib/apt/lists/*

# RUN bash -lc 'rvm install ruby-3.1.4'

# RUN bash -lc 'rvm --default use ruby-3.1.4'
# Install Yarn

RUN npm install -g yarn --force

# Set environment variables for headless operation
# Install imagemagick + dependencies

# install certbot
# apt-get install snapd
# snap install --classic certbot


RUN mkdir /myapp
WORKDIR /myapp


COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install --verbose
COPY . /myapp

RUN npm install -g yarn

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
EXPOSE 3036
EXPOSE 587
EXPOSE 80
EXPOSE 443

# Start the main process
#CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]