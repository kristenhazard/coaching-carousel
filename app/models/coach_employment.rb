class CoachEmployment < ActiveRecord::Base
  belongs_to :coach
  belongs_to :team

  def coach_name
    self.coach.name
  end

  def team_name
    self.team.name
  end
end
