class AddUserIdToAnsweredQuestions < ActiveRecord::Migration
  def change
    add_column :answered_questions, :user_id, :integer
  end
end
