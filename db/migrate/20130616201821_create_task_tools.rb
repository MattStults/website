class CreateTaskTools < ActiveRecord::Migration
  def up
  	create_table :task_tools do |t|
  		t.integer :task_id
  		t.integer :tool_id

  		t.timestamps
  	end
  end

  def down ; drop_table :task_tools ; end
end
