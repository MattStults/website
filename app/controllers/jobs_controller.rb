class JobsController < ApplicationController
  def index
    @job_groups = Job.group_by_company(Job.all)
  end
  def show
    id = params[:id]
    @job = Job.find(id)
  end
  def create
    @job = Job.create!(params[:job])
    flash[:notice] = "#{@job.title} was successfully created."
    redirect_to jobs_path
  end
  def new
  end
  def edit
    @job = Job.find params[:id]
  end
  def update
    @job = Job.find.params[:id]
    @job.update_attributes!(params[:job])
    flash[:notice] = "#{@job.title} was successfully updated."
    redirect_to job_path(@job)
  end
  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    flash[:notice] = "Job '#{@job.title}' deleted."
    redirect_to jobs_path
  end
end
