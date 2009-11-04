# Specific deployment configuration
# Please put general deployment config in config/deploy.rb

# IMPORTANT
# To deploy, you need to have your ssh public key in ~/.ssh/authorized_keys
# of the deploybot on the remote server.

# Deploy with (capistrano and capistrano-ext rubygems required)
# cap [environment] deploy

set :domain,      "vsftpd.mandg.net"

set :deploy_to,   "/var/www/vsftpd"

role :app, "vsftpd.mandg.net"
role :web, "vsftpd.mandg.net"
role :db,  "vsftpd.mandg.net", :primary => true