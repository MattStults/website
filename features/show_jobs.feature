Feature: User can view all jobs, chronologically, by company.

  As a prospective employer
  So that I can understand the candidate's career trajectory
  I want to view all jobs listed chronologically.

Scenario: View unfiltered jobs on entry

  Given I have jobs
  And I am on the Jobs page
  Then I should see all jobs listed chronologically
  And for all jobs the job's company is followed by its title
  And for all jobs the job's title is followed by its start-date and followed by its end-date
  And for all jobs the job's title is followed by its tasks
