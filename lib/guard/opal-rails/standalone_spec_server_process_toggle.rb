require 'guard/compat/plugin'
require 'guard/opal-rails/process_toggle'

module Guard
  class OpalRails < Plugin
    # Starts and stops standalone spec server for opal-rails
    class StandaloneSpecServerProcessToggle < ProcessToggle
      include Rake::DSL if defined? Rake::DSL
      # the url for specs, currently hard coded, anticipate dynamically
      # retrieving this down the road.  Points to standlone spec server
      # from opal-rails
      def spec_url
        'http://localhost:9998'
      end

      def start
        system 'bundle exec rake opal:spec:start_server'
      end

      def stop
        system 'bundle exec rake opal:spec:kill_server'
      end

    end
  end
end
