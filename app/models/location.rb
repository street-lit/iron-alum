class Location < ActiveRecord::Base
  has_many :cohorts
  has_many :students
  has_many :cohorts
end
