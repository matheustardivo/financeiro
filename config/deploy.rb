require File.expand_path('config/capistrano_environment.rb')

set :application, "financeiro"
set :repository,  "git@github.com:matheustardivo/financeiro.git"
set :scm, :git
set :deploy_to, "/home/th31346/repositorios/financeiro"
set :user, Capistrano::CLI.ui.ask("Enter ssh user: ")

role :web, "tardivo.org"                          # Your HTTP server, Apache/etc
role :app, "tardivo.org"                          # This may be the same as your `Web` server
role :db,  "tardivo.org", :primary => true # This is where Rails migrations will run

ssh_options[:paranoid]    = false
default_run_options[:pty] = true
ssh_options[:forward_agent] = true

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
