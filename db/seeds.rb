seed_jobs = [
  { :title => 'Senior Programmer',
    :start => '1-Apr-2012'},
  { :title => 'Senior Programmer',
    :start => '1-Oct-2011',
    :end => '1-Apr-2012'},
  { :title => 'Tech Lead, City of Heroes',
    :start => '1-May-2009',
    :end => '1-Oct-2012'},
  { :title => 'Associate Programmer',
    :start => '1-Aug-2008',
    :end => '1-May-2009'}
]

# NOTE: the following line temporarily allows mass assignment
# (needed if you used attr_accessible/attr_protected in job.rb)
Job.send(:attr_accessible, :title, :company, :location, :start, :end)
seed_jobs.each do |job|
  Job.create!(job)
end
