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
      render json: { error_message: "Error 404: Page Not Found" }.to_json, status: 404
    end
  end

  def new
    student = Student.new
    render json: student.to_json, status: 200
  end

  def create

    if params[:f_name].nil? || params[:f_name].empty?
      error_message = "The 'first name' field was empty or not found"
      render json: { error_message: error_message }.to_json, status: 422
    elsif params[:l_name].nil? || params[:l_name].empty?
      error_message = "The 'l_name' field was empty or not found"
      render json: { error_message: error_message }.to_json, status: 422
    elsif params[:email].nil? || params[:email].empty?
      error_message = "The 'email' field was empty or not found"
      render json: { error_message: error_message }.to_json, status: 422
    elsif params[:bio].nil? || params[:bio].empty?
      error_message = "The 'bio' field was empty or not found"
      render json: { error_message: error_message }.to_json, status: 422
    elsif params[:linked_in].nil? || params[:linked_in].empty?
      error_message = "The 'linked_in' field was empty or not found"
      render json: { error_message: error_message }.to_json, status: 422
    elsif params[:github].nil? || params[:github].empty?
      error_message = "The 'github' field was empty or not found"
      render json: { error_message: error_message }.to_json, status: 422
    elsif params[:employed].nil? || params[:employed].empty?
      error_message = "The 'employed' field was empty or not found"
      render json: { error_message: error_message }.to_json, status: 422
    elsif params[:cohort_id].nil? || params[:cohort_id].empty?
      error_message = "The 'cohort_id' field was empty or not found"
      render json: { error_message: error_message }.to_json, status: 422
    elsif params[:location_id].nil? || params[:location_id].empty?
      error_message = "The 'location_id' field was empty or not found"
      render json: { error_message: error_message }.to_json, status: 422
    else
      student = Student.new
      student.f_name = params[:f_name]
      student.l_name = params[:l_name]
      student.email = params[:email]
      student.bio = params[:bio]
      student.linked_in = params[:linked_in]
      student.github = params[:github]
      student.employed = params[:employed]
      student.place_employed = params[:place_employed]
      student.cohort_id = params[:cohort_id]
      student.location_id = params[:location_id]
      student.save
      render json: student.to_json, status: 201
    end
  end

  def update
    if Student.exists?(params[:id])
      student = Student.find(params[:id])
      student.f_name = params[:f_name] unless params[:f_name].nil? || params[:f_name].empty?
      student.l_name = params[:l_name] unless params[:l_name].nil? || params[:l_name].empty?
      student.email = params[:email] unless params[:email].nil? || params[:email].empty?
      student.bio = params[:bio] unless params[:bio].nil? || params[:bio].empty?
      student.linked_in = params[:linked_in] unless params[:linked_in].nil? || params[:linked_in].empty?
      student.github = params[:github] unless params[:github].nil? || params[:github].empty?
      student.employed = params[:employed] unless params[:employed].nil? || params[:employed].empty?
      student.place_employed = params[:place_employed] unless params[:place_employed].nil? || params[:place_employed].empty?
      student.cohort_id = params[:cohort_id] unless params[:cohort_id].nil? || params[:cohort_id].empty?
      student.location_id = params[:location_id] unless params[:location_id].nil? || params[:location_id].empty?
      student.save
      render json: student.to_json, status: 200
    else
      render json: { error_message: "Error 404: Page Not Found" }.to_json, status: 404
    end
  end

  def destroy
    if Student.exists?(params[:id])
      student = Student.find(params[:id])
      student.destroy
      render json: { message: "Student with id: #{params[:id]} deleted successfully." }.to_json, status: 200
    else
      render json: { error_message: "Error 404: Page Not Found" }.to_json, status: 404
    end
  end
end
