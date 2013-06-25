#encoding: utf-8
begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end
require 'cucumber/formatter/unicode'

Given /I have jobs/ do
	load "#{Rails.root}/db/seeds.rb"
end

Then /I should see all jobs listed chronologically$/ do
	lastJob = nil
	for job in Job.find(:all, :order => "start DESC")
		if lastJob.nil?
			step "I should see \"#{job.title}\""
		else
			step "I should see \"#{lastJob.title}\" is followed by \"#{job.title}\""
		end
		lastJob = job
	end
end

Then /I should see (?:a|an|"|)\s?([^"]+)"? (?:is)\s?followed by (?:a|an|"|)\s?([^"]+)"?$/ do |left, right|
	rightPart = followed_helper right
	regexp = /#{left}.*#{rightPart}/m
	page.body.should =~ regexp
end

Then /for all jobs\w?(.+)$/ do |action|
	for job in Job.all.sort { |x,y| y.start <=> x.start }
		step "then I should see #{translate_job_fields(job, action)}"
	end
end

def translate_job_fields job, inputString
	ret = inputString
	ret.gsub! /(?:its|the job\'s|)\s?title/, Regexp.escape(job.title)
	ret.gsub! /(?:its|a|the job\'s|)\s?start-date/, Regexp.escape(job.start.strftime('%b/%Y'))
	ret.gsub! /(?:its|an|the job\'s|)\s?end-date/, job.end.nil? ? "present" : Regexp.escape(job.end.strftime('%b/%Y'))
	ret.gsub! /(?:its|the|the job\'s|)\s?company/, Regexp.escape(job.company.name)
	ret.gsub! /(?:its|the job\'s|)\s?tasks/, (job.tasks.map { |x| Regexp.escape(x.description) }).join('.*')
	return ret
end

def followed_helper part
	matchData = /(?:a|an|"|)\s?(?<left>[^"]+)"? and followed by (?:a|an|"|)\s?(?<right>[^"]+)"?/.match(part)
	if matchData.nil?
		return part
	else
		left = matchData["left"]
		right = followed_helper(matchData["right"])
		step "I should see #{left} is followed by #{right}"
		return left
	end
end
