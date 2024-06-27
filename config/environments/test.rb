# config/environments/test.rb

Rails.application.configure do
  config.action_controller.allow_forgery_protection = false
  config.action_mailer.delivery_method = :test
  config.active_support.deprecation = :stderr
  config.eager_load = false
end
