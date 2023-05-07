class CreateProblems < ActiveRecord::Migration[7.0]
  def change
    create_table :problems do |t|
      t.string :title
      t.references :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
