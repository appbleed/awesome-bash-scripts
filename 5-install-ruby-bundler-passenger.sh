#!/bin/bash

set -e

echo "INFO: STARTING: Installing Ruby 2.2.2 from local package"

sudo mkdir /opt/ruby
sudo tar xvfz ./artifacts/ruby-2.2.2.tar.gz -C /opt/ruby
cd /opt/ruby/ruby-2.2.2
sudo ./configure
sudo make
sudo make install
sudo -E gem update --system
cd ~/environment-build/ccp-config


echo "INFO: FINISHED: Installing Ruby 2.2.2 from local package"

sudo -E gem install bundler --no-ri --no-rdoc

echo "INFO: STARTING: Installing Bundler gem from online repo"

echo "INFO: FINISHED: Installing Bundler gem from online repo"

echo "INFO: STARTING: Installing Passanger gem from online repo and Configure it"

sudo -E gem install passenger -v 5.0.6 --no-ri --no-rdoc
sudo -E passenger-install-apache2-module
sudo cp ./artifacts/passenger.conf /etc/apache2/conf.d/

# Add logic here if you need to update the content of passenger.conf

echo "INFO: FINISHED: Installing Passanger gem from online repo and Configure it"