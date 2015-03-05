require "seedit/version"
require "active_record"
require "active_record/railtie"
require "active_record/fixtures"

class ActiveRecord::Railtie < Rails::Railtie
  rake_tasks do
    namespace :db do
      task :seed
      Rake::Task["db:seed"].enhance(["db:seed_yaml"])

      task seed_yaml: :environment do
        begin
          fixtures_dir = File.expand_path("db/seeds", Rails.root)
          fixture_files = Dir.glob("#{fixtures_dir}/**/*.yml").map { |f| File.basename(f, '.yml') }

          ActiveRecord::FixtureSet.create_fixtures(fixtures_dir, fixture_files)
        rescue => e
          STDOUT.puts("Rake::Task[db:seed_yaml] failed: #{e.message}")
        end
      end
    end
  end
end
