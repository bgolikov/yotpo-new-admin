class DemoController < ApplicationController
  def hello_world
    @message = params[:message]
  end
end
