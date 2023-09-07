class FakeJob < ApplicationJob
  queue_as :default

  def perform
    # Do something later
    puts "Hello, this is a fake job"
    sleep 3
    puts "Ok, it's done"
  end
end
