class CreateModelTypes < ActiveRecord::Migration
  def change
    create_table :model_types do |t|
      t.string :name
      t.string :slug
      t.string :model_type_code
      t.decimal :base_price, precision: 12, scale: 2
      t.references :model

      t.timestamps null: false
    end
    add_index :model_types, :slug, unique: true
  end
end
