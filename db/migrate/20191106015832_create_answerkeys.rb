class CreateAnswerkeys < ActiveRecord::Migration
  def change
    create_table :answerkeys do |t|
      t.integer :exam_id
      t.integer :subject_id
      t.integer :topic
      t.integer :chapter_id
      t.text :question_ids

      t.timestamps null: false
    end
  end
end
