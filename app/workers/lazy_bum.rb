class LazyBum
  include Sidekiq::Worker

  def lounge_around(name, time_wasted)
  	puts "hey #{name}, you've been sitting there for #{time_wasted} hours!"
  end

end