require "surrounded/rails/version"
require "surrounded"
require "rails"
module Surrounded
  class Railtie < ::Rails::Railtie
    initializer 'surrounded.active_record' do |app|
      ActiveRecord::Base.class_eval {
        include Surrounded
        # There is no earlier hook to set this variable.
        # The after_initialize callback occurs to late because
        # the initialize method has a procedure which calls
        # respond_to? and Surrounded adds respond_to_missing?
        # to get information from the context (which is the first
        # item in the @__surroundings__ collection).
        def surroundings
          @__surroundings__ ||= []
        end
      }
    end

    initializer 'surrounded.action_controller' do |app|
      ActionController::Base.send(:include, Surrounded)
    end
  end
end
