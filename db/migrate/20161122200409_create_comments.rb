class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.integer :location_id
      t.integer :user_rating
      t.text :user_comment
      t.timestamps
    end
  end
end
