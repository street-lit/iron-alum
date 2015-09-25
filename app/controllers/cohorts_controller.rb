class CohortsController < ApplicationController

  def index
    cohorts = Cohort.all
    render json: cohorts.to_json, status: 200
  end

  def show
    if Cohort.exists?(params[:id])
      cohort = Cohort.find(params[:id])
      render json: cohort.to_json, status: 200
    else
      render json: { error_message: "The record id: #{params[:id]} not found!" }.to_json, status: 404
    end
  end

  def new
    cohort = Cohort.new
    render json: cohort.to_json, status: 200
  end

  def create
    if params[:name].nil? || params[:name].empty?
      error_message = "The 'name' field was empty or not found"
      render json: { error_message: error_message }.to_json, status: 422
    elsif params[:location_id].nil? || params[:location_id].empty?
      error_message = "The 'location_id' field was empty or not found"
      render json: { error_message: error_message }.to_json, status: 422
    else
      cohort = Cohort.new
      cohort.name = params[:name]
      cohort.location_id = params[:location_id]
      cohort.save
      render json: cohort.to_json, status: 201
    end
  end

  def update
    if Cohort.exists?(params[:id])
      cohort = Cohort.find(params[:id])
      cohort.name = params[:name] unless params[:name].nil? || params[:name].empty?
      cohort.location_id = params[:location_id] unless params[:location_id].nil? || params[:location_id].empty?
      cohort.save
      render json: cohort.to_json, status: 200
    else
      render json: { error_message: "The record id: #{params[:id]} not found!" }.to_json, status: 404
    end
  end

  def destroy
    if Cohort.exists?(params[:id])
      cohort = Cohort.find(params[:id])
      cohort.destroy
      render json: { message: "Cohort with id: #{params[:id]} deleted successfully." }.to_json, status: 200
    else
      render json: { error_message: "Cohort id: #{params[:id]} not found!" }.to_json, status: 404
    end
  end
end
