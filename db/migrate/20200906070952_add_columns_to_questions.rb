class AddColumnsToQuestions < ActiveRecord::Migration[6.0]
  def change

  	add_column :questions, :teaming_stages, :string
  	add_column :questions, :appears, :string
  	add_column :questions, :frequency, :integer
  	add_column :questions, :type, :string
  	add_column :questions, :required, :boolean
  	add_column :questions, :conditions, :string

  end
end
