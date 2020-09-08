class CreateOpnions < ActiveRecord::Migration[6.0]
  def change
    create_table :opnions do |t|
      t.integer :timestamp
      t.integer :rating
      t.string :review_text
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
