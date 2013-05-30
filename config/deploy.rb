require "bundler/capistrano"
# Add RVM's lib directory to the load path.
# $:.unshift(File.expand_path('./lib', ENV['rvm_path']))
# Load RVM's capistrano plugin.    
require "rvm/capistrano"

# be sure to change these
set :user, 'root'
set :domain, '173.230.142.67'
set :application, 'goaltracker'

# the rest should be good
set :rvm_bin_path, "/usr/local/rvm/bin"
set :rvm_type, :system 
set :repository,  "git@github.com:sanandnarayan/goaltracker.git"
set :local_repository,  "git@github.com:sanandnarayan/goaltracker.git"
set :deploy_to, "/var/www/#{application}"
set :scm, 'git'
set :branch, 'master'
set :scm_verbose, true
set :use_sudo, false
set :rails_env, "development" #added for delayed job  

server domain, :app, :web

namespace :deploy do
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

after 'deploy:update_code' do
  run "cd #{release_path}; RAILS_ENV=development rake db:migrate"
end
