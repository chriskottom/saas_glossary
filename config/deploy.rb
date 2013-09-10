set :application, 'SaaS Glossary'
set :location, 'saasglossary.com'
set :user, 'deploy'
set :group, 'www-data'
set :use_sudo, false

set :scm, 'none'
set :deploy_via, :copy
set :repository, '.'
set :deploy_to, '/var/www/saasglossary.com'
set :group_writable, true
set :copy_exclude, %w( *~ .bundle Capfile config/ Gemfile Gemfile.lock bin/ deploy.rb vendor/ .git/ .gitignore )

server location, :web, :app, :db

namespace :deploy do
  task :default do
    update
  end

  task :finalize_update do
    escaped_release = latest_release.to_s.shellescape
    commands = []
    commands << "chgrp -R #{group} #{escaped_release}"
    commands << "chmod -R -- g+w #{escaped_release}" if fetch(:group_writable, true)
    run commands.join(' && ') if commands.any?
  end

  task :migrate do
    puts 'deploy:migrate not implemented'
  end

  task :start do
    puts 'deploy:start not implemented'
  end

  task :stop do 
    puts 'deploy:stop not implemented'
  end

  task :restart do
    puts 'deploy:restart not implemented'
  end
end

after "deploy", "deploy:cleanup"
