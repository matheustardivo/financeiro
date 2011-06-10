unless Capistrano::Configuration.respond_to?(:instance)
  abort "This extension requires Capistrano 2"
end

Capistrano::Configuration.instance.load do

  namespace :deploy do

    namespace :db do

      desc <<-DESC
        Creates the database.yml and production.rb configuration files in shared path.
      DESC
      task :setup, :except => { :no_release => true } do

        db_location = "config/deploy/database.yml.erb"
        raise "database.yml.erb template not found" unless File.file?(db_location)
        db_template = File.read(db_location)
        db_config = ERB.new(db_template)
        
        smtp_location = "config/deploy/environments/production.rb.erb"
        raise "production.rb.erb template not found" unless File.file?(smtp_location)
        smtp_template = File.read(smtp_location)
        smtp_config = ERB.new(smtp_template)

        run "mkdir -p #{shared_path}/config"
        run "mkdir -p #{shared_path}/config/environments"
        put db_config.result(binding), "#{shared_path}/config/database.yml"
        put smtp_config.result(binding), "#{shared_path}/config/environments/production.rb"
      end

      desc <<-DESC
        [internal] Updates the symlink for database.yml and production.rb files to the just deployed release.
      DESC
      task :symlink, :except => { :no_release => true } do
        run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml" 
        run "ln -nfs #{shared_path}/config/environments/production.rb #{release_path}/config/environments/production.rb" 
      end

    end

    after "deploy:setup",           "deploy:db:setup"   unless fetch(:skip_db_setup, false)
    after "deploy:finalize_update", "deploy:db:symlink"

  end

end
