class AddUnseenToUsers < ActiveRecord::Migration
  def change
	add_column :users, :unseen_ids, :text
  end
end
