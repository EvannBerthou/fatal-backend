class CreateQcms < ActiveRecord::Migration[7.0]
  def change
    create_table :qcms do |t|
      t.string :entete
      t.string :titre
      t.boolean :is_randomized
      t.belongs_to :user, class_name: 'user', foreign_key: 'user_id'

      t.timestamps
    end
  end
end
