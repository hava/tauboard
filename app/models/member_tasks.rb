class MemberTasks
  attr_accessor :member_name, :todo, :active, :test, :done
  def initialize(owner)
    @member_name = owner
    @todo = []
    @active = []
    @test = []
    @done = []
  end
end