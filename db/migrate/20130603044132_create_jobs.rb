class CreateJobs < ActiveRecord::Migration
  def up
    create_table 'jobs' do |t|
      t.string 'title'
      t.date 'start'
      t.date 'end'
      t.belongs_to :company
      # auto track changes:
      t.timestamps
    end
  end

  def down
    drop_table 'jobs'
  end
end
