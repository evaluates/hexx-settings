# encoding: utf-8

module Hexx

  # Class Settings provides the interface for a gem's settings storage
  #
  # @example
  #   require "hexx-settings"
  #
  #   module MyGem
  #     class Settings < Hexx::Settings
  #       attr_accessor :foo
  #     end
  #   end
  #
  #   MyGem::Settings.configure do |config|
  #     config.foo = :bar
  #   end
  #
  #   MyGem::Settings.instance.foo # => :bar
  #   MyGem::Settings[:foo]        # => :bar
  #
  # @author Andrew Kozin <Andrew.Kozin@gmail.com>
  #
  class Settings

  end # class Settings

end # module Hexx
