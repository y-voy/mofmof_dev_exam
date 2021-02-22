require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module DevExam
  class Application < Rails::Application
  end
end
