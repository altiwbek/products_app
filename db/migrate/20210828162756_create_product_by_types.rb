class CreateProductByTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :product_by_types do |t|
      t.references :product, null: false, foreign_key: true
      t.references :product_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
