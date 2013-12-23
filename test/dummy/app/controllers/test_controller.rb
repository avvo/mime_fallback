class TestController < ApplicationController

  def basic
  end

  def responding
    respond_to do |format|
      format.json { render :json => {format: request.format.symbol, string: request.format.to_s} }
    end

  end

end