require "surrounded/rails/version"
require "surrounded"
require "rails"
module Surrounded
  class Railtie < ::Rails::Railtie
    initializer 'surrounded.active_record' do |app|
      ActiveRecord::Base.send(:include, Surrounded)
    end

    initializer 'surrounded.action_controller' do |app|
      ActionController::Base.send(:include, Surrounded)
    end
  end
end
