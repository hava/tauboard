require "active_resource"

class Story < Resource
  attr_accessor :priority
  self.site = "http://www.pivotaltracker.com/services/v3/projects/:project_id"

  def priority=(priority)
    @priority = priority
  end

  def points
    estimate.to_f / 4
  end
end
