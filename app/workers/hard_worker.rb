# class HardWorker
#   include Sidekiq::Worker

#   sidekiq_options queue: :awesome
  
#   def perform(name, task)
#     # do something
#     puts "hello #{name} doing #{task}"
#   end
# end

class HardWorker
    include Sidekiq::Worker

    def perform(name, count)
        puts 'Doing some hard work!'

        a_row = UserInfo.new(
         :user => "someone",
         :misc1 => 0,
         :misc2 => 0,
         :misc3 => 0,
         :comment => "Made from HardWorker",
         :time_changed => Time.now
        )

        a_row.save

        puts 'Done with hard work!'
    end
end