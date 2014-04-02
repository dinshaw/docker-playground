FROM ubuntu:12.04
MAINTAINER Education Team at Docker <education@docker.com>

RUN apt-get update && apt-get install -y curl wget git ruby rubygems ruby-dev
RUN gem install --no-ri --no-rdoc bundler

ADD /sinatra_app /opt/sinatra_app

RUN cd /opt/sinatra_app; bundle install

EXPOSE 4567

CMD cd /opt/sinatra_app; rackup config.ru -p 4567

