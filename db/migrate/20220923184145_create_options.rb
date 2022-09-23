class CreateOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :options do |t|
      t.belongs_to :question, class_name: 'question', foreign_key: 'question_id'
      t.integer "typedoption", :default => 0, :null => false
      t.string "valeur"
      t.timestamps
    end
  end
end
