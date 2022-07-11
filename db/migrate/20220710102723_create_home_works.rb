class CreateHomeWorks < ActiveRecord::Migration[7.0]
  def change
    create_table :home_works do |t|
      t.string :assignment
      t.string :description
      t.string :course_name
      t.references :room, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
