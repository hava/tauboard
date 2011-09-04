require "active_resource"

class Project< ActiveResource::Base
  self.site = "https://www.pivotaltracker.com/services/v3"
end