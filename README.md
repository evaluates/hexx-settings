Hexx::Settings
===================

[![Gem Version](https://img.shields.io/gem/v/hexx-settings.svg)][gem]
[![Build Status](https://img.shields.io/travis/nepalez/hexx-settings/master.svg)][travis]
[![Dependency Status](https://img.shields.io/gemnasium/nepalez/hexx-settings.svg)][gemnasium]
[![Code Climate](https://img.shields.io/codeclimate/github/nepalez/hexx-settings.svg)][codeclimate]
[![Coverage](https://img.shields.io/coveralls/nepalez/hexx-settings.svg)][coveralls]
[![Inline docs](http://inch-ci.org/github/nepalez/hexx-settings.svg)][inch]

[codeclimate]: https://codeclimate.com/github/nepalez/hexx-settings
[coveralls]: https://coveralls.io/r/nepalez/hexx-settings
[gem]: https://rubygems.org/gems/hexx-settings
[gemnasium]: https://gemnasium.com/nepalez/hexx-settings
[travis]: https://travis-ci.org/nepalez/hexx-settings
[inch]: https://inch-ci.org/github/nepalez/hexx-settings

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

Tested under [rubies compatible to API 1.9.3+](.travis.yml).

Uses [RSpec] 3.0+ for testing and [hexx-suit] for dev/test tools collection.

[RSpec]: http://rspec.info/
[hexx-suit]: http://github.com/nepalez/hexx-suit

License
-------

See the [MIT LICENSE](LICENSE).
