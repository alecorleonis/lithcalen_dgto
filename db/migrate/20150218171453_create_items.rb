class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :list_id
      t.string :item_name
      t.text :item_description
      t.integer :item_rating
      t.boolean :item_recommendation

      t.timestamps
    end
  end
end
