class CreateItems < ActiveRecord::Migration
  enable_extension 'citext'
  def change
    create_table :items do |t|
      t.citext :name
      t.text :description
      t.decimal :unit_price
      t.references :merchant, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
