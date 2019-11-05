class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :key_answer

      t.timestamps null: false
    end
  end
end
