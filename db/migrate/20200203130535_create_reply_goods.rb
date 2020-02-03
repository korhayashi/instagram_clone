class CreateReplyGoods < ActiveRecord::Migration[5.2]
  def change
    create_table :reply_goods do |t|
      t.integer :user_id
      t.integer :reply_id

      t.timestamps
    end
  end
end
