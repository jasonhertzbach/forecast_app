class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|
      t.belongs_to :user, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
