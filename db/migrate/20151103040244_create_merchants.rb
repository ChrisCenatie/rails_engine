class CreateMerchants < ActiveRecord::Migration
  enable_extension 'citext'
  def change
    create_table :merchants do |t|
      t.citext :name

      t.timestamps null: false
    end
  end
end
