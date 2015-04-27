# encoding: utf-8

require "singleton"

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
    include Singleton

    # Calls the block with the instance of settings
    #
    # @return [undefined]
    #
    # @yieldparam [Hexx::Settings] instance The instance of settings
    # @yieldreturn [undefined]
    def self.configure
      yield instance if block_given?
    end

    # Returns a value of the setting
    #
    # @param [Symbol, String] setting
    #
    # @return [Object] the assigned value of the setting
    def self.[](setting)
      instance.public_send setting
    end

  end # class Settings

end # module Hexx
