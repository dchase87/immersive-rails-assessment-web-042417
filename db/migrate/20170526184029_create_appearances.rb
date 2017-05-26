class CreateAppearances < ActiveRecord::Migration[5.0]
  def change
    create_table :appearances do |t|
      t.integer :rating
      t.references :guest, foreign_key: true
      t.references :episode, foreign_key: true
    end
  end
end
