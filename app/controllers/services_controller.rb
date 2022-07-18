class ServicesController < ApplicationController
  def index
    @services = ServiceContent.all
  end
end
