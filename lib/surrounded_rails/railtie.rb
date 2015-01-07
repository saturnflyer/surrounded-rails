require "surrounded_rails/version"
require "surrounded"
require "rails"
module SurroundedRails
  class Railtie < ::Rails::Railtie
    if defined?(ActiveRecord)
      initializer 'surrounded_rails.active_record' do |app|
        ActiveRecord::Base.send(:include, SurroundedRails)
      end
    end

    if defined?(Mongoid)
      initializer 'surrounded_rails.mongoid' do |app|
        Mongoid::Document.send(:include, SurroundedRails)
      end
    end

    initializer 'surrounded_rails.action_controller' do |app|
      ActionController::Base.send(:include, SurroundedRails)
    end
  end
end
