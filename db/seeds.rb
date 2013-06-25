#encoding: utf-8
seed_tools = [
  { :description => 'Java'},
  { :description => 'AS3'},
  { :description => 'C#'},
  { :description => 'C'},
  { :description => 'C/C++'}
]

# NOTE: the following line temporarily allows mass assignment
# (needed if you used attr_accessible/attr_protected in tool.rb)
Tool.send(:attr_accessible, :description)
seed_tools.each do |tool|
  Tool.create!(tool)
end

seed_companies = [
  { :name => 'Rumble Entertainment',
    :description => 'Maker of high AAA free to play games',
    :location => 'Redwood Shores, CA'},
  { :name => 'NCSoft: Paragon Studios',
    :description => 'Maker of City of Heroes MMO',
    :location => 'Mountain View, CA'},
  { :name => 'Independent Contractor',
    :description => 'Had contracts with a high tech art and a medical billing and dispatch company',
    :location => 'San Francisco, CA'},
  { :name => 'The University of Iowa',
    :description => 'Worked for a Visual Environment research lab and a Epidemic Disease Simulation group',
    :location => 'Iowa City, IA'}
]

# NOTE: the following line temporarily allows mass assignment
# (needed if you used attr_accessible/attr_protected in tool.rb)
Company.send(:attr_accessible, :name, :description, :location)
seed_companies.each do |company|
  Company.create!(company)
end

# Create jobs
Job.send(:attr_accessible, :company_id, :title, :start, :end)
seed_jobs = [
  { :company_id => Company.find_by_name('Rumble Entertainment').id,
    :title => "Senior Programmer",
    :start => Date.new(2012,4,1),
    :end => nil},
  { :company_id => Company.find_by_name('NCSoft: Paragon Studios').id,
    :title => "Senior Programmer, Unannounced",
    :start => Date.new(2011,10,1),
    :end => Date.new(2012,4,1)},
  { :company_id => Company.find_by_name('NCSoft: Paragon Studios').id,
    :title => "Tech Lead, City of Heroes",
    :start => Date.new(2009,5,1),
    :end => Date.new(2011,10,1)},
  { :company_id => Company.find_by_name('NCSoft: Paragon Studios').id,
    :title => "Associate Programmer",
    :start => Date.new(2008,8,1),
    :end => Date.new(2009,5,1)},
  { :company_id => Company.find_by_name('Independent Contractor').id,
    :title => "Contract Programmer",
    :start => Date.new(2008,2,1),
    :end => Date.new(2008,1,1)},
  { :company_id => Company.find_by_name('The University of Iowa').id,
    :title => "Research Programmer",
    :start => Date.new(2006,12,1),
    :end => Date.new(2008,1,1)}
]
kr = Job.create!(seed_jobs[0])
mi = Job.create!(seed_jobs[1])
coh = Job.create!(seed_jobs[2])
cov = Job.create!(seed_jobs[3])
snb = Job.create!(seed_jobs[4])
ia = Job.create!(seed_jobs[5])

# Create tasks
Task.send(:attr_accessible, :job_id, :description)
seed_tasks = [
  { :job_id => kr.id,
    :description => "Owned (architected/implemented) significant features for a tablet and browser game including Rewards, Abilities and Player State.  Each feature involved thread-safe server logic (Java), data configuration (Jackson Json Processor), client-server communication and client UI (Unity/C#)"},
  { :job_id => kr.id,
    :description => "Developed a significant social feature for King’s Road involving safe management of data shared by multiple servers (Java) and client state management/UI (AS3)."},
  { :job_id => kr.id,
    :description => "Led initiatives to improve code quality by writing tools to visualize network communication/program structure, introducing unit testing and mentoring other programmers through code reviews."},
  { :job_id => mi.id,
    :description => "Prototyped and implemented game UI including four major screens and many minor UI components in C++, AS3 and Flash IDE."},
  { :job_id => coh.id,
    :description => "Led 8-13 programmers through a Subscription to Free-to-Play business model change, a boxed expansion and five other major content releases."},
  { :job_id => coh.id,
    :description => "Personally contributed code, debugged problems and provided on-call support as needed to meet scheduling requirements and ensure the quality of our live service."},
  { :job_id => coh.id,
    :description => "Managed programming team, including providing reviews and performance improvement plans."},
  { :job_id => cov.id,
    :description => "Owned the search feature for our player created content system, implementing a record-level inverted index IR system, network communication, client and developer-facing user interfaces and a suite of automated tests."},
  { :job_id => cov.id,
    :description => "Extended a grouping system to allow multiple users to share volatile data across multiple servers."},
  { :job_id => cov.id,
    :description => "Took ownership of a large number of existing in-house tools, e.g. our internally written version control system, our “image server” catalog generator, and our CS tool suite."},
  { :job_id => snb.id,
    :description => "Worked on small computer vision games using OpenGL and OpenCV."},
  { :job_id => ia.id,
    :description => "Maintained C and Java code for a virtual environment lab and disease transmission research."}
]
kr0 = Task.create!(seed_tasks[0])
kr1 = Task.create!(seed_tasks[1])
kr2 = Task.create!(seed_tasks[2])
mi0 = Task.create!(seed_tasks[3])
coh0 = Task.create!(seed_tasks[4])
coh1 = Task.create!(seed_tasks[5])
coh2 = Task.create!(seed_tasks[6])
cov0 = Task.create!(seed_tasks[7])
cov1 = Task.create!(seed_tasks[8])
cov2 = Task.create!(seed_tasks[9])
snb0 = Task.create!(seed_tasks[10])
ia0 = Task.create!(seed_tasks[11])

# TaskTool mappings
seed_task_tools = [
  { :task => kr0,
    :tool => Tool.find_by_description('Java')},
  { :task => kr0,
    :tool => Tool.find_by_description('C#')},
  { :task => kr1,
    :tool => Tool.find_by_description('Java')},
  { :task => kr1,
    :tool => Tool.find_by_description('AS3')},
  { :task => kr2,
    :tool => Tool.find_by_description('Java')},

  { :task => mi0,
    :tool => Tool.find_by_description('C/C++')},
  { :task => coh0,
    :tool => Tool.find_by_description('C')},
  { :task => coh1,
    :tool => Tool.find_by_description('C')},
  { :task => coh2,
    :tool => Tool.find_by_description('C')},
  { :task => cov0,
    :tool => Tool.find_by_description('C')},
  { :task => cov1,
    :tool => Tool.find_by_description('C')},
  { :task => cov2,
    :tool => Tool.find_by_description('C')},

  { :task => snb0,
    :tool => Tool.find_by_description('C/C++')},
  { :task => snb0,
    :tool => Tool.find_by_description('Java')},
  { :task => snb0,
    :tool => Tool.find_by_description('AS3')},

  { :task => ia0,
    :tool => Tool.find_by_description('C/C++')},
  { :task => ia0,
    :tool => Tool.find_by_description('Java')},
  { :task => ia0,
    :tool => Tool.find_by_description('AS3')}
]
Task_Tool.send(:attr_accessible, :task, :tool)
seed_task_tools.each do |task_tool|
  Task_Tool.create!(task_tool)
end
