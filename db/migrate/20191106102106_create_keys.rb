class CreateKeys < ActiveRecord::Migration
  def change
    create_table :keys do |t|
      t.integer :question_id
      t.integer :answer_id

      t.timestamps null: false
    end
  end
end
