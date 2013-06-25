class Tool < ActiveRecord::Base
	has_many :taskTools
	has_many :tasks, :through => :taskTools

  attr_accessible :description
end
