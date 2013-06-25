class Job < ActiveRecord::Base
	belongs_to :company
	attr_protected :company_id
	validates :company_id, :presence => true
	validates_associated :company
	has_many :tasks, :dependent => :destroy
	has_many :tools, :through => :tasks

  attr_accessible :title, :start, :end

  def self.group_by_company jobsIn
  	jobs = jobsIn.sort { |x,y| y.start <=> x.start }
  	currentGroup = nil
  	ret = []
  	jobs.each do |job|
  		if currentGroup.nil? or currentGroup[:company] != job.company
  			currentGroup = {:company => job.company, :jobs => []}
  			ret << currentGroup
  		end
  		currentGroup[:jobs] << job
  	end
  	return ret
  end
end
