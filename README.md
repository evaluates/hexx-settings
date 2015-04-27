Hexx::Settings
===================

[![Gem Version](https://img.shields.io/gem/v/hexx-settings.svg?style=flat)][gem]
[![Build Status](https://img.shields.io/travis/nepalez/hexx-settings/master.svg?style=flat)][travis]
[![Dependency Status](https://img.shields.io/gemnasium/nepalez/hexx-settings.svg?style=flat)][gemnasium]
[![Code Climate](https://img.shields.io/codeclimate/github/nepalez/hexx-settings.svg?style=flat)][codeclimate]
[![Coverage](https://img.shields.io/coveralls/nepalez/hexx-settings.svg?style=flat)][coveralls]
[![Inline docs](http://inch-ci.org/github/nepalez/hexx-settings.svg)][inch]
[![Documentation Status](https://readthedocs.org/projects/attestor/badge/?version=latest)][readthedocs] # @todo

[codeclimate]: https://codeclimate.com/github/nepalez/hexx-settings
[coveralls]: https://coveralls.io/r/nepalez/hexx-settings
[gem]: https://rubygems.org/gems/hexx-settings
[gemnasium]: https://gemnasium.com/nepalez/hexx-settings
[travis]: https://travis-ci.org/nepalez/hexx-settings
[inch]: https://inch-ci.org/github/nepalez/hexx-settings
[readthedocs]: https://readthedocs.org/projects/attestor/?badge=latest

Provides base class for settings' storage.

Synopsis
--------

```ruby
# lib/my_gem/settings.rb
module MyGem

  class Settings < Hexx::Settings

    attr_accessor :foo

  end # class Settings

end # module MyGem
```

The class provides a [singleton instance] to store settings in.

Class `Settings` predefines `configure` and `[]` class methods.
The first one yields the block with the instance of its own, the second
is a shortcut to the instance methods.

```ruby
MyGem::Settings.configure do |config|
  config.foo = :bar
end

MyGem::Settings.instance.foo # => :bar
# this is the same as above:
MyGem::Settings[:foo]        # => :bar
```

[singleton instance]: http://ruby-doc.org/stdlib-1.9.3/libdoc/singleton/rdoc/Singleton.html

Installation
------------

Add this line to your application's Gemfile:

```ruby
# Gemfile
gem "hexx-settings"
```

Then execute:

```
bundle
```

Or add it manually:

```
gem install hexx-settings
```

Compatibility
-------------

Tested under rubies compatible to API 1.9.3+: # @todo

* MRI 1.9.3+
* Rubinius (mode 1.9+)
* JRuby-1.7 (mode 1.9+)
* JRuby-9.0.0.0.pre1

Uses [RSpec] 3.0+ for testing and [hexx-suit] for dev/test tools collection.

[RSpec]: http://rspec.info/
[hexx-suit]: http://github.com/nepalez/hexx-suit

Contributing
------------

* Fork the project.
* Read the [STYLEGUIDE](config/metrics/STYLEGUIDE).
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with Rakefile or version
  (if you want to have your own version, that is fine but bump version
  in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

License
-------

See the [MIT LICENSE](LICENSE).
