class CreateCustomers < ActiveRecord::Migration
  enable_extension 'citext'
  def change
    create_table :customers do |t|
      t.citext :first_name
      t.citext :last_name

      t.timestamps null: false
    end
  end
end
