class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|

      t.string :name
      t.belongs_to :question
    end
  end
end
