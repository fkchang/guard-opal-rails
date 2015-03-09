require_relative 'process_toggle'
require_relative 'null_process_toggle'
require_relative 'standalone_spec_server_process_toggle'
require 'guard/compat/plugin'

module Guard
  class OpalRails < Plugin
    # This class returns the correct type of ProcessToggle based on options
    # currently there are 2 cases
    # 1) url provided, so no processes need to be started
    # 2) url not provided or nil, so se start up the standalong spec server
    class ProcessToggleFactory
      def self.process_toggle_for(options)
        if options[:spec_url]
          NullProcessToggle.new(options)
        else
          StandaloneSpecServerProcessToggle.new(options)
        end
      end
    end
  end
end
