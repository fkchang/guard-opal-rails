 module Guard
  class OpalRails < Plugin
    # Base class for process toggles.  These are classes which control
    # start/stop for various situations
    class ProcessToggle
      def initialize(options)
        @options = options
      end
    end
  end
end
