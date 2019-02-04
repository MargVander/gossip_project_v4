class CreateJoinTableUserPrivateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :join_table_user_private_messages do |t|
    	t.references :recipient, index: true
    	t.belongs_to :private_message, index: :true

      t.timestamps
    end
  end
end
