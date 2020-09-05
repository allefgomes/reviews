class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :slug, unique: true

      t.timestamps
    end
    add_index :products, :name, unique: true
  end
end
