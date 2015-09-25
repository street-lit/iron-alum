class LocationsController < ApplicationController

  def index
    locations = Location.all
    render json: locations.to_json, status: 200
  end

  def show
    if Location.exists?(params[:id])
      location = Location.find(params[:id])
      render json: location.to_json, status: 200
    else
      render json: { error_message: "The record id: #{params[:id]} not found!" }.to_json, status: 404
    end
  end

  def new
    location = Location.new
    render json: location.to_json, status: 200
  end

  def create
    if params[:city].nil? || params[:city].empty?
      error_message = "The 'city' field was empty or not found"
      render json: { error_message: error_message }.to_json, status: 422
    elsif params[:state].nil? || params[:state].empty?
      error_message = "The 'state' field was empty or not found"
      render json: { error_message: error_message }.to_json, status: 422
    else
      location = Location.new
      location.city = params[:city]
      location.state = params[:state]
      location.save
      render json: cohort.to_json, status: 201
    end
  end

  def update
    if Location.exists?(params[:id])
      location = Location.find(params[:id])
      location.city = params[:city] unless params[:city].nil? || params[:city].empty?
      location.state = params[:state] unless params[:state].nil? || params[:state].empty?
      location.save
      render json: location.to_json, status: 200
    else
      render json: { error_message: "The record id: #{params[:id]} not found!" }.to_json, status: 404
    end
  end

  def destroy

  end
end
