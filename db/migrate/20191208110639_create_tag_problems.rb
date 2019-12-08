class CreateTagProblems < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_problems do |t|
      t.references :tag, foreign_key: true
      t.references :problem, foreign_key: true

      t.timestamps
      t.index [:problem_id, :tag_id], unique: true
    end
  end
end
