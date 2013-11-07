This is a lecture on Redis 

1. brew install redis

2. gem install sidekiq

3. add 	gem 'sidekiq' then bundle install

4. start redis server using redis-server 
or redis-server /usr/local/etc/redis.conf if it needs to be pointed to the conf file

5. how to kill zombies! er, processes
ps aux | grep redis

this gives a list of the process id's that are connected to Redis. you can then kill -9 "p.id"

6. redis-cli for a command prompt that is sort of like the Rails console

7. what is a background job? when an app needs to do work that isn't directly related to response to the client should be queued as a background job

8. in sidekiq there needs to be a directory called "workers" under app/
so mkdir app/workers

9. classes in this directory must have the same name as their files, so: touch app/workers/text_printing_worker.rb

10. define the class 
TextPrintingWorker
  include Sidekiq::Worker

  def perform
  	puts "i loooove printing text!"
  end
end

11. open up Rails console and type TextPrintingWorker.new.perform

12. then type TextPrintingWorker.perform_async

13. in redis-cli type keys * to see what's queued

14. type queues then smembers queues

15. then type lrange queue:default 0 -1

this will give a list of jobs queued and their timestamps

16. bundle exec sidekiq to start up the sidekiq engine
sidekiq has a bunch of workers ready to perform the task.