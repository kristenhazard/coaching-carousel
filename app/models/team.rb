class Team < ActiveRecord::Base
  has_many :coach_employments
end
