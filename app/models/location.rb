class Location < ActiveRecord::Base
  has_many :cohorts
  has_many :students, through: :cohorts
end
