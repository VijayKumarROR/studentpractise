class ChangeColumnNameInAnswerkey < ActiveRecord::Migration
  def change
  	rename_column :answerkeys, :topic, :topic_id
  end
end
