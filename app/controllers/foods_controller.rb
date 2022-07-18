class FoodsController < ApplicationController
  def index
    @foods = Food.all
    #@foods = Dir.glob("*.PNG", base: "app/assets/images/sushineta")
  end

  def show
    @food = Food.find(params[:id])
  end
end
