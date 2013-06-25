require 'spec_helper'

describe Job do
  describe 'group by company, descending'	do
  	before(:each) do
  		@company = {
  			:a => mock_model(Company),
  			:b => mock_model(Company),
  			:c => mock_model(Company)
  		}
			@jobs = [
				mock_job(@company[:a], 1),
				mock_job(@company[:b], 3),
				mock_job(@company[:a], 2),
				mock_job(@company[:c], 0),
				mock_job(@company[:a], 4)
			]
		end
		def mock_job company, start
			mock = mock_model(Job)
			mock.stub!(:company).and_return(company)
			mock.stub!(:start).and_return(start)
			return mock
		end
		def for_each_company groups
			groups.each do |group|
				yield group[:company], group
			end
		end
		def for_each_job groups
			groups.each do |group|
				group[:jobs].each do |job|
	  			yield job, group
	  		end
			end
		end
  	it 'should group all jobs by their company' do
  		for_each_job(Job.group_by_company(@jobs)) do |job, group|
  			job.company.should eql(group[:company])
  		end
  	end
  	it 'should list jobs in reverse chronological order' do
  		prevStart = +1.0/0.0 #infinity
  		for_each_job(Job.group_by_company(@jobs)) do |job|
  			job.start.should be < prevStart
  			prevStart = job.start
  		end
  	end
  	it 'should compact adjacent jobs with the same company into the same group' do
  		lastCompany = nil
  		for_each_company(Job.group_by_company(@jobs)) do |company|
  			company.should_not eql lastCompany
  			lastCompany = company
  		end
  	end
  end
end
