require "bundler/setup"

require 'active_resource'

  class Membership < ActiveResource::Base
    self.site = "http://www.pivotaltracker.com/services/v3/projects/:project_id"
    headers['X-TrackerToken'] = '2b9fa035bf48557cc8f32de9149ec16e'
  end

  members =  Membership.find(:all, :params => {:project_id => '21123'})
  puts members

  class Iteration < ActiveResource::Base
    self.site = "http://www.pivotaltracker.com/services/v3/projects/:project_id"
    headers['X-TrackerToken'] = '2b9fa035bf48557cc8f32de9149ec16e'
  end



  iterations =  Iteration.find(:all, :params => {:project_id => '21123', :group => "current"})
 iterations[0].attributes['stories'].each do  |story|
   puts "#{story.attributes['owned_by']} #{story.attributes['current_state']}"
 end

