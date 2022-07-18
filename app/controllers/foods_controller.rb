class FoodsController < ApplicationController
  def index
    @foods = Food.all
    #@foods = Dir.glob("*.PNG", base: "app/assets/images/sushineta")
  end
end
