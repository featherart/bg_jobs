class TextPrintingWorker
  include Sidekiq::Worker

  def perform
  	puts "i loooove printing text!"
  end
end