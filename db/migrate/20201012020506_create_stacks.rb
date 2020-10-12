class CreateStacks < ActiveRecord::Migration[6.0]
  def change
    create_table :stacks do |t|
      t.string :name
      t.string :address
      t.decimal :lat
      t.decimal :lng
      t.integer :category_id
      t.integer :category_id2
      t.boolean :closed
      t.string :hours
      t.string :website
      t.string :address_line_2
      t.string :phone_number

      t.timestamps
    end
  end
end
