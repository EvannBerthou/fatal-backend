class AddPointsToReponse < ActiveRecord::Migration[7.0]
  def change
    add_column :reponses, :points, :integer, default: 0, null: false
  end
end