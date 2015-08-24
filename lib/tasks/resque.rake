require 'resque/tasks'
require 'resque/scheduler/tasks'

# adds tasks from reque gem to rails app
namespace :resque do
	task :setup do
		require 'resque'
		require 'resque/scheduler'
	end
end