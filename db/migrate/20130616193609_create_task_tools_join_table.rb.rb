class CreateTaskToolsJoinTable < ActiveRecord::Migration
  def up
  	create_table :tasks_tools, :id => false do |t|
  		t.integer :task_id
  		t.integer :tool_id
  	end
  end

  def down ; drop_table :tasks_tools ; end
end
