class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text :image,       null: false
      t.string :name,      null: false
      t.text :description, null: false
      t.integer :price,    null: false
      t.timestamps
    end
  end
end
