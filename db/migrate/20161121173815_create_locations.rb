class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :category
      t.integer :rating
      t.boolean :ramp
      t.boolean :step
      t.boolean :seating
      t.boolean :scooter
      t.text :comment
      t.string :yelp_id
      t.integer :user_id
      t.timestamps
    end
  end
end
