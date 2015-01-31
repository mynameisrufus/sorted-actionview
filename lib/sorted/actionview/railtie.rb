require 'rails'
require 'rails/railtie'
require 'sorted/actionview/helper'

module Sorted
  module ActiveRecord
    class Railtie < ::Rails::Railtie
      config.after_initialize do |_app|
        ActiveSupport.on_load(:action_view) do
          include Sorted::ActionView::Helper
        end
      end
    end
  end
end
