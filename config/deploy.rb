# set :application, "example"
# set :repository, "git@example.com:example.git"
# set :server, "example.com"
#set :scm, :git
set :application, "elmd"          #the name of the folder you chose when setting up the domain
set :repository, "ssh://dlv@bandit.homelinux.net:8008/home/git/elmd.git"
set :branch, "master"
set :domain, "ericlarson2010.com"   #the one you ssh into
#set :user, "dougv"            #the user you created when setting up the domain (has to have shell access)

set :applicationdir, "/home/#{user}/#{application}"  # The standard Dreamhost setup
 
#set :repository, "ssh://dlv@bandit.homelinux.net:8008/home/git/elmd.git"
#set :scm, :git
 
# deploy config
#set :deploy_to, applicationdir       # Where on the server your app will be deployed
#set :deploy_via, :remote_cache
 
# additional settings
#default_run_options[:pty] = true  # Forgo errors when deploying from windows
#ssh_options[:keys] = %w(/Path/To/id_rsa)            # If you are using ssh_keys
#set :chmod755, "app config db lib public vendor script script/* public/disp*"
#set :use_sudo, false

#set :branch, "master"
 
role :app, domain
role :web, domain
role :db,  domain, :primary => true
 
#Passenger stop, start, and restart calls
namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end
 
  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
end