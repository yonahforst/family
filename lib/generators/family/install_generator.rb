require 'rails'

module Family
  class InstallGenerator < ::Rails::Generators::Base
    include Rails::Generators::Migration
    source_root File.expand_path('../templates', __FILE__)

    desc "add the migrations"
    def self.next_migration_number(path)
      unless @prev_migration_nr
        @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
      else
        @prev_migration_nr += 1
      end
     @prev_migration_nr.to_s
    end

    def copy_migrations
      migration_template "create_user_adoptions.rb", "db/migrate/create_user_adoptions.rb"
    end
  end
end