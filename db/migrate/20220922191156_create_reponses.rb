class CreateReponses < ActiveRecord::Migration[7.0]
  def change
    create_table :reponses do |t|
      t.belongs_to :question, class_name: 'question', foreign_key: 'question_id'
      t.string "texte"
      t.boolean "isRight"
      t.timestamps
    end
    add_column :questions, :typedequestion, :integer, default: 0
  end
end
