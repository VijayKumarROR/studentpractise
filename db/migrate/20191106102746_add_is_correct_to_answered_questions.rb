class AddIsCorrectToAnsweredQuestions < ActiveRecord::Migration
  def change
  	add_column :answered_questions, :is_correct, :string
  end
end
