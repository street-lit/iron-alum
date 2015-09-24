class LocationsController < ApplicationController

  def index
    locations = Location.all
    render json: locations.to_json, status: 200
  end

  def show

  end

  def new

  end

  def create

  end

  def update

  end

  def destroy

  end
end
