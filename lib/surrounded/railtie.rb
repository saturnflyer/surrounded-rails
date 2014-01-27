require "surrounded/rails/version"
require "surrounded"
require "rails"
module Surrounded
  class Railtie < ::Rails::Railtie
    if defined?(ActiveRecord)
      initializer 'surrounded.active_record' do |app|
        ActiveRecord::Base.send(:include, Surrounded)
      end
    end

    if defined?(Mongoid)
      initializer 'surrounded.mongoid' do |app|
        Mongoid::Document.send(:include, Surrounded)
      end
    end

    initializer 'surrounded.action_controller' do |app|
      ActionController::Base.send(:include, Surrounded)
    end
  end
end
