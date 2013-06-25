class CreateTasks < ActiveRecord::Migration
  def up
    create_table 'tasks' do |t|
      t.text 'description'
      t.belongs_to :job
    end
  end

  def down ; drop_table 'tasks' ; end
end
