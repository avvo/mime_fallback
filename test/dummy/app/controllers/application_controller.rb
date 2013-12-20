class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :detect_mobile

  private
  
  def detect_mobile
    if params[:mobile]
      request.format = :mobile
    end
    true
  end
end
