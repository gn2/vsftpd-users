set :application, "vsftpd-users"
set :stages, %w(staging)
set :default_stage, "staging"
# This needs to be after the stages variable declaration
require 'capistrano/ext/multistage'

set :scm,         :git
set :repository,  "git@github.com:astorije/vsftpd-users.git"
set :branch, "master"

# Remote caching will keep a local git repo on the server you’re deploying to and simply run a fetch from that rather than an entire clone. 
set :deploy_via, :remote_cache

# Add support for submodules in plugins
set :git_enable_submodules, 1

default_run_options[:pty] = true 
set :use_sudo,    false
set :user, "deploybot"

# With that, we can use our private keys on github (instead of creating one for the deploy-bot)
set :ssh_options, { :forward_agent => true }


# To deploy to non-default environments (i.e. test, production), use
# cap testing deploy:cold
# cap production deploy
# etc...


namespace :deploy do
  desc "Link in some stuff" 
  task :after_symlink do
    # run "ln -sf #{shared_path}/config/database.yml #{current_path}/config/database.yml"
  end
  
  [:start, :stop].each do |t|
    desc "#{t} task does not make sense with passenger."
    task t, :roles => :app do ; end
  end

  desc "Restarting server"  
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end
end
