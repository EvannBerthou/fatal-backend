class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :texte
      t.boolean :right

      t.timestamps
    end

    create_table :qcms_questions, id: false do |t|
      t.belongs_to :question, foreign_key: true
      t.belongs_to :qcm, foreign_key: true
    end
  end
end
