namespace :user do
  desc "Enrich all users with Clearbit (async)"
  task update_all: :environment do
    users = User.all
    puts "Enqueuing update of #{users.size} users..."
    users.each do |user|
      UpdateUserJob.perform_later(user)
    end
  end

  desc "Enrich a given user with Clearbit (sync)"
  task update: :environment do
    user = User.find(ENV["USER_ID"])
    puts "Enriching #{user.email}..."
    UpdateUserJob.perform_now(user)
    # rake task will return when job is _done_
  end
end
