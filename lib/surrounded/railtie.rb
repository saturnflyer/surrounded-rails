require "surrounded/rails/version"
require "surrounded"
require "rails"
module Surrounded
  class Railtie < ::Rails::Railtie
    initializer 'surrounded.active_record' do |app|
      ActiveRecord::Base.class_eval {
        include Surrounded
        # This relies on a private method (present in Rails 3 and 4)
        # because there is no earlier hook to set this variable.
        # The after_initialize callback occurs to late because
        # the initialize method has a procedure which calls
        # respond_to? and Surrounded adds respond_to_missing?
        # to get information from the context (which is the first
        # item in the @__surroundings__ collection).
        def init_internals_with_surrounded
          Surrounded.create_surroundings(self)
          init_internals_without_surrounded
        end
        alias_method_chain :init_internals, :surrounded
      }
    end
  end
end
