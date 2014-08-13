class RemoveColumnsFromResponses < ActiveRecord::Migration
  def change
    remove_column :responses, :survey_id
    remove_column :responses, :question_id
  end
end
