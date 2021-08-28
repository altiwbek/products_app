class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.references :manufacturer, null: false, foreign_key: true
      t.decimal :cost
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
