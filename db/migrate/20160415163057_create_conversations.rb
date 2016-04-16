class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
    	t.integer :buyer_id, null: false
    	t.integer :seller_id, null: false
    	t.integer :item_id, null: false

    	t.timestamps null: false
    end
  end
end
