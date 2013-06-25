class CreateCompanies < ActiveRecord::Migration
  def up
    create_table 'companies' do |t|
      t.text 'name'
      t.text 'description'
      t.text 'location'
    end
  end

  def down ; drop_table 'companies' ; end
end
