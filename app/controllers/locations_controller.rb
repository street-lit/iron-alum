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
      render json: { error_message: "Error 404: Page Not Found" }.to_json, status: 404
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
      render json: { error_message: "Error 404: Page Not Found" }.to_json, status: 404
    end
  end

  def destroy
    if Location.exists?(params[:id])
      location = Location.find(params[:id])
      location.destroy
      render json: { message: "Location with id: #{params[:id]} deleted successfully." }.to_json, status: 200
    else
      render json: { error_message: "Error 404: Page Not Found" }.to_json, status: 404
    end
  end

  def by_cohort
    if Location.exists?(Location.where(city: params[:city]).first)
      cohort_by_location = Location.find_by(city: "#{params[:city]}").cohorts.find_by(course_name: "#{params[:course_name]}").students
      render json: cohort_by_location.to_json, status: 200
    else
      render json: { error_message: "Error 404: Page Not Found" }.to_json, status: 404
    end
  end

  def by_student_by_cohort # Add Error Page!!!!
    if Location.exists?(Location.where(city: params[:city]).first)
      student_by_cohort = Location.find_by(city: "#{params[:city]}").cohorts.find_by(course_name: "#{params[:course_name]}").students.find_by(id: "#{params[:id]}")
      render json: student_by_cohort.to_json, status: 200
    end
  end

  def students_by_city
    if Location.exists?(Location.where(city: params[:city]).first)
      students = Location.find_by(city: "#{params[:city]}").students
      render json: students.to_json, status: 200
    end
  end
end


























