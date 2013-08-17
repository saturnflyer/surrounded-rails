require "surrounded/rails/version"
require "surrounded"
require "rails"
module Surrounded
  class Railtie < ::Rails::Railtie
    initializer 'surrounded.active_record' do |app|
      ActiveRecord::Base.class_eval {
        include Surrounded

        after_initialize :__setup_surrounded

        def __setup_surrounded
          Surrounded.create_surroundings(self)
        end
      }
    end
  end
end
