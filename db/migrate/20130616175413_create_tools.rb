class CreateTools < ActiveRecord::Migration
  def up
    create_table 'tools' do |t|
      t.text 'description'
    end
  end

  def down ; drop_table 'tools' ; end
end
