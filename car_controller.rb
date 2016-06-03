class CarController < ApplicationController

  def new_car
    @car = Car.new(params[:make],params[:year])
    cookies[:new_car] = @car.to_yaml
  end

  def speed_up
    @car = YAML.load(cookies[:new_car])
    @car.speed_up
    cookies[:new_car] = @car.to_yaml
    render 'new_car.html.erb'
  end
end
