# Guard::OpalRails


Guard::OpalRails allows to automatically launch specs when files are modified.  For fast spec runs, it does not use the rake opal:spec task.


## Installation

Add this line to your application's Gemfile (inside the development group):

```ruby
gem 'guard-opal-rails'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install guard-opal-rails

Add guard definition to your Guardfile by running this command:

```
$ guard init opal-rails
```

## Usage

Please read [Guard usage doc](https://github.com/guard/guard#readme).
### List of available options:

``` ruby
spec_url: nil            # The url to hit to run the specs. Point to your_rails_app/opal_spec
                         # or don't set/set to nil to use standalong server
sound_on: true           # set to false to turn off, works w/osx terminal-notifier
success_sound: "default" # Sound played with successful specs I use a custom applause sound
fail_sound: "Sosumi      # Sound played with failed specs, defaults to "Sosumi"

```

## Notes

### spec_url and how to run the spec server
To run specs, this plugin hits the url specified in spec_url (your_rails_app/opal_spec) or kicks off the standalone spec server defined in opal-rails 0.7.1 and higher (at time of writing you may have to point to my opal-rails fork github.com/fkchang/opal-rails to get this feature.  So which server should you use? Some considerations

#### cases to point to your own rails app

* You're already running your rails app, and don't want the standalone server is yet another process to run.
* You run something like pow, your app is always available
* You run windows or Jruby, the current implementation of the standalone spec server uses fork (not supported on windows MRI or Jruby) to daemonize the process
* You need to run opal-rails specs in > that 1 project at once, currently the spec server is fixed to startup on localhost:9998

#### Cases to use the standalone spec server
* Your app isn't always running
* You only need to run opal-rails specs in one project at a time

### Notifications

The notifications sounds were built and tested around OSX's terminal notifier - apologies to users of other notification plugins. Additions welcoe

* Default sounds for success/fail were picked on sounds that ought to exist in OSX defaults (System Preferences > Sound > Sound Effects), I personally use much more dramatic custom sounds to good effect (make sme happy)
* Clicking on notification will take you to the spec url page - handy on getting more details on a spec fail


## Contributing

1. Fork it ( https://github.com/[my-github-username]/guard-opal-rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

### Author

[Forrest Chang](https://github.com/fkchang) ([@fkchang2000](https://twitter.com/fkchang2000))

### Contributors

[https://github.com/guard/guard-opal-rails/contributors](https://github.com/guard/guard-opal-rails/contributors)
