class CreateYelpClients < ActiveRecord::Migration[5.0]
  def change
    create_table :yelp_clients do |t|

      t.timestamps
    end
  end
end
