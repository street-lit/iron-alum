class StudentsController < ApplicationController

  def index
    students = Student.all
    render json: students.to_json, status: 200
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
