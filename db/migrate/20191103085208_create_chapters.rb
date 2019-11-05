class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :name
      t.integer :topic_id

      t.timestamps null: false
    end
  end
end
