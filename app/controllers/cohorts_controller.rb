class CohortsController < ApplicationController

  def index
    cohorts = Cohort.all
    render json: cohorts.to_json, status: 200
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
