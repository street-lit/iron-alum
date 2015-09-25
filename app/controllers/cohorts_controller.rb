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
      render json: { error_message: "Error 404: Page Not Found" }.to_json, status: 404
    end
  end

  def new
    cohort = Cohort.new
    render json: cohort.to_json, status: 200
  end

  def create
    if params[:course_name].nil? || params[:course_name].empty?
      error_message = "The 'course_name' field was empty or not found"
      render json: { error_message: error_message }.to_json, status: 422
    elsif params[:location_id].nil? || params[:location_id].empty?
      error_message = "The 'location_id' field was empty or not found"
      render json: { error_message: error_message }.to_json, status: 422
    elsif params[:start_date].nil? || params[:start_date].empty?
      error_message = "The 'start_date' field was empty or not found"
      render json: { error_message: error_message }.to_json, status: 422
    elsif params[:end_date].nil? || params[:end_date].empty?
      error_message = "The 'end_date' field was empty or not found"
      render json: { error_message: error_message }.to_json, status: 422
    else
      cohort = Cohort.new
      cohort.course_name = params[:course_name]
      cohort.location_id = params[:location_id]
      cohort.start_date = params[:start_date]
      cohort.end_date = params[:end_date]
      cohort.save
      render json: cohort.to_json, status: 201
    end
  end

  def update
    if Cohort.exists?(params[:id])
      cohort = Cohort.find(params[:id])
      cohort.course_name = params[:course_name] unless params[:course_name].nil? || params[:course_name].empty?
      cohort.location_id = params[:location_id] unless params[:location_id].nil? || params[:location_id].empty?
      cohort.start_date = params[:start_date] unless params[:start_date].nil? || params[:start_date].empty?
      cohort.end_date = params[:end_date] unless params[:end_date].nil? || params[:end_date].empty?
      cohort.save
      render json: cohort.to_json, status: 200
    else
      render json: { error_message: "Error 404: Page Not Found" }.to_json, status: 404
    end
  end

  def destroy
    if Cohort.exists?(params[:id])
      cohort = Cohort.find(params[:id])
      cohort.destroy
      render json: { message: "Cohort with id: #{params[:id]} deleted successfully." }.to_json, status: 200
    else
      render json: { error_message: "Error 404: Page Not Found" }.to_json, status: 404
    end
  end
end
