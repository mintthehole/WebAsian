require 'bundler/capistrano'
# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end


set :application, "test_app"
set :repository,  "git@github.com:mintthehole/WebAsian.git"
set :scm, :git

set :scm_username, 'mintthehole'
set :scm_password, 'Victorpol1'
set :deploy_via, :remote_cache
set :git_enable_submodules, 1 # if you have vendored rails
set :git_shallow_clone, 1
set :scm_verbose, true

set :chmod755, "app config db lib public vendor script script/* public/disp*"
set :use_sudo, false
set :bundle_cmd, 'source $HOME/.bash_profile && bundle'
set :rake, "#{rake} --trace"
def aws_staging name
	task name do
		yield    
		role :app, domain
		role :web, domain
		role :db, domain, :primary => true
		ssh_options[:keys] = [File.join(ENV["HOME"], ".ssh", "id_rsa")]
	end
end

aws_staging :ec2_staging do
	set :user, 'sunbeemmaxp2011'  # Your dreamhost account's username
	set :domain, 'manage.webasiansystems.com'  # Dreamhost servername where your account is located 
	set :project, 'test_app'  # Your application as its called in the repository
	set :application, 'manage.webasiansystems.com'  # Your app's location (domain or sub-domain name as setup in panel)
	set :applicationdir, "/home/#{user}/#{application}"  # The standard Dreamhost setup
	set :deploy_to, applicationdir
	set :branch, "master"
end



namespace :deploy do
  after "deploy:update_code" do
    run "cp #{deploy_to}/shared/database.yml #{release_path}/config/database.yml"
  end

	task :start do ; end
	task :stop do ; end

	task :restart, :roles => :app, :except => { :no_release => true } do
		run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
	end
end
