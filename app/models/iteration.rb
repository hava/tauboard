require "active_resource"

class Iteration < Resource
  self.site = "http://www.pivotaltracker.com/services/v3/projects/:project_id"
end
