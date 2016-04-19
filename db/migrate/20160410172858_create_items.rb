class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
    	t.string :title, null: false
    	t.string :description, null: false
    	t.string :photo_url
    	t.integer :price, null: false
    	t.integer :seller_id, null: false

    	t.timestamps null: false
    end
  end
end
