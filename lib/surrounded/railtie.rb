require "surrounded/rails/version"
require "surrounded"
require "rails"
module Surrounded
  class Railtie < ::Rails::Railtie
    initializer 'surrounded.active_record' do |app|
      ActiveRecord::Base.send(:include, ::Surrounded)
      ActiveRecord::Base.class_eval {
        # Ideally this should hook into the initialization process
        # and set the @__surroundings__ collection there.
        # Currently I haven't found a way to do that.
        #
        # Surrounded uses respond_to_missing? and method_missing
        # which are two methods used when an ActiveRecord object
        # is initialized.
        #
        # The after_initialize callback happens after those methods
        # are used.
        #
        define_method(:surroundings){
          @__surroundings__ ||= []
        }
      }
    end
  end
end
