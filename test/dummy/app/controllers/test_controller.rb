class TestController < ApplicationController

  def basic
  end

  def responding
    respond_to do |format|
      format.json { render :json => {format: request.format.symbol, string: request.format.to_s} }
    end
  end

  def mobile_only
    respond_to do |format|
      format.mobile
    end
  end

  def html_only
    respond_to do |format|
      format.html
    end
  end

end