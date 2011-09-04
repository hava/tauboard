require "iteration"
require "member_tasks"

class Board
  attr_accessor :member_tasks

  def initialize(iteration)
    @iteration = iteration
    @member_tasks = tasks
  end

  def tasks
    result = {}
    @iteration.stories.each_with_index do |story_hash, priority|
      next unless story_hash.respond_to?('owned_by')
      story = Story.new(story_hash.attributes)
      story.priority=priority
      owner = story.owned_by
#      story.attributes.each { |a| puts a  }
      member_tasks = result[owner] || MemberTasks.new(owner)
      case story.current_state
        when 'unstarted', 'rejected'
          member_tasks.todo.insert(0, story)
        when 'started'
          member_tasks.active << story
        when 'finished', 'delivered'
          member_tasks.test << story
        when 'accepted'
          member_tasks.done << story
      end
      result[owner] = member_tasks
    end
    result.values.sort { |a, b| a.member_name <=> b.member_name }
  end

  def points(section)
    all_tasks_of_section = []
    @member_tasks.each do |member_task|
      all_tasks_of_section = all_tasks_of_section + member_task.send(section)
    end

    sum = 0.0
    all_tasks_of_section.each do |story|
      sum += story.points
    end
    sum
  end

end