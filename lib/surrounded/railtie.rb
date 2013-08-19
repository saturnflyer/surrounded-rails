require "surrounded/rails/version"
require "surrounded"
require "rails"
module Surrounded
  class Railtie < ::Rails::Railtie
    initializer 'surrounded.active_record' do |app|
      ActiveRecord::Base.send(:include, ::Surrounded)
      ActiveRecord::Base.class_eval {
        define_method(:surroundings){
          @__surroundings__ ||= []
        }
      }
    end
  end
end
