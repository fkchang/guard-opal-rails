require "guard/opal-rails/version"
require 'guard/compat/plugin'

# notification "emacs"

module Guard
  class OpalRails < Plugin
    # the plugin states we care about

    # Initializes a Guard plugin.
    # Don't do any work here, especially as Guard plugins get initialized even if they are not in an active group!
    #
    # @param [Hash] options the custom Guard plugin options
    # @option options [Array<Guard::Watcher>] watchers the Guard plugin file watchers
    # @option options [Symbol] group the group this Guard plugin belongs to
    # @option options [Boolean] any_return allow any object to be returned from a watcher
    #
    def initialize(options = {})
      super
      @spec_url = options[:spec_url]
      @sounds_on = options[:sounds_on] == false ? false :  true
      @success_sound = options[:success_sound] || "default"
      @fail_sound = options[:fail_sound] || "Sosumi"
    end
    # Called once when Guard starts. Please override initialize method to init stuff.
    #
    # @raise [:task_has_failed] when start has failed
    # @return [Object] the task result
    #
    def start
      run_opal_specs
    end

    # Called when `stop|quit|exit|s|q|e + enter` is pressed (when Guard quits).
    #
    # @raise [:task_has_failed] when stop has failed
    # @return [Object] the task result
    #
    def stop
    end

    # Called when just `enter` is pressed
    # This method should be principally used for long action like running all specs/tests/...
    #
    # @raise [:task_has_failed] when run_all has failed
    # @return [Object] the task result
    #
    def run_all
      run_opal_specs
    end

    # Called on file(s) modifications that the Guard plugin watches.
    #
    # @param [Array<String>] paths the changes files or paths
    # @raise [:task_has_failed] when run_on_modifications has failed
    # @return [Object] the task result
    #
    def run_on_modifications(paths)
      run_opal_specs
    end

    # learned this trick from guard-rails-assets because guard plugins don't expect to have hyphenated names
    def self.template(plugin_location)
      File.read(template_path(plugin_location))
    end

    def self.template_path(plugin_location)
      # workaround because Guard discards the '-' when detecting template path
      File.join(plugin_location, 'lib', 'guard', 'opal-rails', 'templates', 'Guardfile')
    end

    private
    # this is the opal-rspec runner that uses phantomjs to hit your page
    def spec_runner
      @spec_runner ||= "#{Gem::Specification.find_by_path("opal-rspec").full_gem_path}/vendor/spec_runner.js"
    end

    # Runs the specs, parses the output to give a notification
    def run_opal_specs
      results = `phantomjs #{spec_runner} #{@spec_url}`
      puts results              # want this to show on the terminal
      if results =~ /((\d+) examples, (\d+) failures .+\))/
        message = $1
        total = $2
        failures = $3.to_i
        if failures > 0
          title = "#{failures} Specs failed"
          sound = @fail_sound
          image = :failed
        else
          title = "#{total} Specs passed"
          sound = @success_sound
          image = :success
        end
      else
        message = results
        title = "Specs failed to run"
        image = :failed
        sound = @fail_sound
      end
      notify_params = {
        type: image,
        title: title,
        open: @spec_url
      }
      notify_params.merge!({sound: sound}) if @sounds_on
      Guard::Compat::UI.notify(message, notify_params)
    end
  end
end
