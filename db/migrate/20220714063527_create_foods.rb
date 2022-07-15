class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string  :sushi_neta_name, null: false
      t.text    :explanation,     null: false
      t.integer :category_id,     null: false
      t.integer :season_month,    null: false
      t.string  :image,           null: false
      t.timestamps
    end
    add_index :foods, :sushi_neta_name, unique: true
  end
end
