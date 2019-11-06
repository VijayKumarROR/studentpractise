class AddColumnsToAnsweredQuestions < ActiveRecord::Migration
  def change
  	add_column :answered_questions, :exam_id, :integer
  	add_column :answered_questions, :subject_id, :integer
  	add_column :answered_questions, :topic_id, :integer
  	add_column :answered_questions, :chapter_id, :integer
  end
end
