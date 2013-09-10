set :application, 'SaaS Glossary'
set :location, 'saasglossary.com'
set :user, 'deploy'
set :group, 'www-data'
set :use_sudo, false

set :scm, 'none'
set :deploy_via, :copy
set :repository, '.'
set :deploy_to, '/var/www/saasglossary.com'
set :copy_exclude, %w( *~ .bundle Capfile config/ Gemfile Gemfile.lock bin/ deploy.rb vendor/ .git/ .gitignore)

server 'saasglossary.com', :web, :app, :db

namespace :deploy do
  task :migrate do
    puts 'Skipping migrate'
  end

  task :finalize_update do
    puts "Skipping finalize_update."
  end

  task :start do
    puts "Skipping start."
  end

  task :stop do 
    puts "Skipping stop."
  end

  task :restart do
    puts "Skipping restart."
  end
end

after "deploy", "deploy:cleanup"
