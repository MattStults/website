class Task < ActiveRecord::Base
	belongs_to :job
	attr_protected :job_id
	validates :job_id, :presence => true
	validates_associated :job
	has_many :taskTools
	has_many :tools, :through => :taskTools

  attr_accessible :description
end
