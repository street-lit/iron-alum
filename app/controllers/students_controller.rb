class StudentsController < ApplicationController

  def index
    students = Student.all
    render json: students.to_json, status: 200
  end

  def show
    if Student.exists?(params[:id])
      student = Student.find(params[:id])
      render json: student.to_json, status: 200
    else
      render json: { error_message: "The record id: #{params[:id]} not found!" }.to_json, status: 404
    end
  end

  def new
    student = Student.new
    render json: student.to_json, status: 200
  end

  def create
    if params[:name].nil? || params[:name].empty?
      error_message = "The 'name' field was empty or not found"
      render json: { error_message: error_message }.to_json, status: 422
    elsif params[:cohort_id].nil? || params[:cohort_id].empty?
      error_message = "The 'cohort_id' field was empty or not found"
      render json: { error_message: error_message }.to_json, status: 422
    else
      student = Student.new
      student.name = params[:name]
      student.cohort_id = params[:cohort_id]
      student.save
      render json: student.to_json, status: 201
    end
  end

  def update
    if Student.exists?(params[:id])
      student = Student.find(params[:id])
      student.name = params[:name] unless params[:name].nil? || params[:name].empty?
      student.cohort_id = params[:cohort_id] unless params[:cohort_id].nil? || params[:cohort_id].empty?
      student.save
      render json: student.to_json, status: 200
    else
      render json: { error_message: "The record id: #{params[:id]} not found!" }.to_json, status: 404
    end
  end

  def destroy
    if Student.exists?(params[:id])
      student = Student.find(params[:id])
      student.destroy
      render json: { message: "Student with id: #{params[:id]} deleted successfully." }.to_json, status: 200
    else
      render json: { error_message: "Student id: #{params[:id]} not found!" }.to_json, status: 404
    end
  end
end
