class UpdateUserJob < ApplicationJob
  queue_as :default

  def perform(user)
    # Do something later
    puts "Call API clearbit #{user.email}"
    sleep 2
    puts "Done #{user.email}!"
  end
end
