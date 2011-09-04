class ApplicationController < ActionController::Base
  protect_from_forgery

  around_filter :require_ssl_filter

  def require_ssl_filter
    request.env['HTTPS'] = 'on' if Rails.env == 'production'
    yield
  end

end
