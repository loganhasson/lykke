require 'bundler/capistrano'

set :application, "lykke"
set :repository,  "git@github.com:loganhasson/lykke.git"
set :user, "loganhasson"
set :branch, "master"
set :deploy_to, "/home/#{ user }/#{ application }"
set :use_sudo, false
set :scm, :git
set :rvm_type, :system
set :app_one_ip, '192.241.175.170'
set :app_two_ip, '192.241.175.87'

role :app, "#{app_one_ip}"
role :app, "#{app_two_ip}"
role :web, "#{app_one_ip}"
role :web, "#{app_two_ip}"
default_run_options[:pty] = true
default_run_options[:shell] = '/bin/bash --login'

namespace :deploy do
  task :kill_unicorn, :roles => :app do
    run "if kill -0 `cat #{shared_path}/pids/unicorn.pid`> /dev/null 2>&1; then kill -9 `cat #{shared_path}/pids/unicorn.pid`; else echo 'Unicorn is not running'; fi"
  end

  task :symlink_api_credentials, :roles => :app do
    run "ln -nfs #{shared_path}/application.yml #{release_path}/config/application.yml"
  end

  task :migrate, :roles => :app do
    run "cd #{current_path} && rake db:migrate RAILS_ENV=production"
  end
 
  task :start do ; end
  task :stop do ; end
  task :restart do
    run "cd #{current_path} && unicorn -c config/unicorn.rb -D -E production"
  end
end

after "deploy:finalize_update", "deploy:kill_unicorn", "deploy:symlink_api_credentials"
before "deploy:restart", "deploy:migrate"
