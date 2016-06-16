class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :null_session

  rescue_from StandardError do |exception|
    logger.error exception.message
    exception.backtrace.each { |line| logger.error line }
    raise exception
  end
end
