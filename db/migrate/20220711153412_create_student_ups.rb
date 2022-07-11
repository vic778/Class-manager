class CreateStudentUps < ActiveRecord::Migration[7.0]
  def change
    create_table :student_ups do |t|
      t.string :assignment
      t.references :room, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :home_work, null: false, foreign_key: true

      t.timestamps
    end
  end
end
