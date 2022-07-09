class CreateAnnonces < ActiveRecord::Migration[7.0]
  def change
    create_table :annonces do |t|
      t.text :message

      t.timestamps
    end
  end
end
