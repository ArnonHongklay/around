class Blog::Admin::BaseController < Blog::ApplicationController
  include Blog::ControllerHelpers::Auth
  force_ssl if Rails.application.config.admin_force_ssl # TODO: find a way to test that with capybara

  layout "layouts/blog/admin"
end
