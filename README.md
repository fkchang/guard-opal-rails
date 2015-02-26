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
spec_url: nil            # The url to hit to run the specs. You may want it to hit your rails_app/opal_spec
sound_on: true           # set to false to turn off, works w/osx terminal-notifier
success_sound: "default" # Sound played with successful specs I use a custom applause sound
fail_sound: "Sosumi      # Sound played with failed specs, defaults to "Sosumi"


```


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
