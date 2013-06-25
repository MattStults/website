require 'spec_helper'

describe JobsController do
	describe 'index'	do
		it 'should call the model method that groups jobs by company' do
			results = [mock('group1')]
			Job.should_receive(:group_by_company).and_return(results)

			post :index
		end
		it 'should put the job groups in @job_groups' do
			results = [mock('group1')]
			Job.stub(:group_by_company).and_return(results)
			post :index
			assigns(:job_groups).should == results
		end
	end
end
