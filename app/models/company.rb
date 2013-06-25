class Company < ActiveRecord::Base
	has_many :jobs, :dependent => :destroy

  attr_accessible :name, :description, :location
end
