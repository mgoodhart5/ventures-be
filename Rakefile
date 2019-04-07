# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.


require_relative 'config/application'

Rails.application.load_tasks

desc "Changes status to past for user events"
task :update_status => :environment do
  events = Event.joins(:user_events).select("events.*").where.not(user_events: { status: "past" })
  past_events = events.find_all do |event|
    DateTime.strptime(event.end_date, "%m-%d-%Y") < DateTime.now
  end
  past_events.each do |event|
    event.user_events.each do |user_event|
      user_event.update(status: 2)
    end
  end
end
