class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.belongs_to :qcm, class_name: 'qcm', foreign_key: 'qcm_id'
      t.string "texte"
      t.timestamps
    end
    create_table :categories_questions, id: false do |t|
      t.belongs_to :categorie
      t.belongs_to :question
    end
  end
end
