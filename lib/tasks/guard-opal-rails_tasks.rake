module Guard
  class OpalRails
    class RakeTask
      include Rake::DSL if defined? Rake::DSL

    end
  end
end

desc "booga booga"
task :booga do
  puts "Booga man"
end
