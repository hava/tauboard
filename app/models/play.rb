require "./app/models/iteration"

@@lock = Mutex.new

def test(num, token)
  @@lock.synchronize do
    Iteration.headers['X-TrackerToken'] = token

    begin
      puts "#{num} #{Iteration.find(:all, :params => {:project_id => '21123', :group => "current"})}"
    rescue
      puts "#{num} no token"
    end
  end
end

t1 =Thread.new {
  i = 0
  while (i<3)
    test('1', '2b9fa035bf48557cc8f32de9149ec16e')
    i += 1
  end

}

t2 =Thread.new {
  i = 0
  while (i<3)
    test('2', '2')
    i += 1
  end
}

t1.join
t2.join
