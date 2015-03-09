require 'guard/opal-rails/process_toggle'

module Guard
  class OpalRails < Plugin
    # Does nothing for start and stop
    class NullProcessToggle < ProcessToggle
      def spec_url
        @options[:spec_url]
      end

      def start
      end

      def stop
      end
    end
  end
end
