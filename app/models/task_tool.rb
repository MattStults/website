class Task_Tool < ActiveRecord::Base
	belongs_to :task
	belongs_to :tool
end
