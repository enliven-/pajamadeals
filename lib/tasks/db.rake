namespace :db do
  task dump: :environment do
    abcs = ActiveRecord::Base.configurations
    if abcs["development"]["adapter"] =~ /mysql/
      branch = `git branch|grep '^*'|sed 's/\\*\\ //'|sed 's/\\//-/g'`.strip
      `mysqldump -u #{abcs["development"]["username"]} #{abcs["development"]["database"]} | gzip -c > db/#{branch}.sql.gz`
    else
      raise "Don't know how to dump database of type #{abcs["development"]["adapter"]}"
    end
  end

  task undump: :environment do
    abcs = ActiveRecord::Base.configurations
    if abcs["development"]["adapter"] =~ /mysql/
      ActiveRecord::Base.connection.recreate_database(abcs["development"]["database"])
      branch = `git branch|grep '^*'|sed 's/\\*\\ //'|sed 's/\\//-/g'`.strip
      `gunzip -c db/#{branch}.sql.gz | mysql -u #{abcs["development"]["username"]} #{abcs["development"]["database"]}`
    else
      raise "Don't know how to recreate database of type #{abcs["development"]["adapter"]}"
    end
  end
end