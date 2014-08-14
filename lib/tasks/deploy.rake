namespace :deploy do
  task :production do
    `git push origin master && cap production deploy && cap production deploy:restart`
  end
  
  task :staging do
    `git push origin master && cap staging deploy && cap staging deploy:restart`
  end
end