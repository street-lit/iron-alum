class Location < ActiveRecord::Base
  has_many :cohorts
  has_many :students
  has_many :cohorts
  validates_presence_of :city, :state
end
