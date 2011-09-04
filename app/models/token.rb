require "active_resource"

class Token < Resource
  attr_accessor :user, :password
  self.site = "https://www.pivotaltracker.com/services/v3"
end
