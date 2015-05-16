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

    # Tries to load given initializer
    #
    # @example
    #   Settings.initialize_from "my_module", at: ENV["PATH_TO_INITIALIZER"]
    #
    # @param [#to_s] filename
    #   The name of the initializer file to be loaded
    #
    # @option [#to_s] :at
    #   The absolute path to the initializers directory
    #
    # @return [undefined]
    #
    def self.initialize_from(filename, at: nil)
      if at
        require File.join at, filename
      else
        warn "You should provide the path to initializers"
      end
    rescue LoadError
      filename << ".rb" unless filename[/\.rb$/]
      warn "You should provide the '#{ filename }' initializer"
    end

    # Resets all settings
    #
    # @return [undefined]
    #
    def self.reset
      instance.instance_variables.each do |variable|
        instance.instance_variable_set variable, nil
      end
    end

  end # class Settings

end # module Hexx
