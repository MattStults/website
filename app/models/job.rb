class Job < ActiveRecord::Base
  attr_accessible :title, :start, :end
end
