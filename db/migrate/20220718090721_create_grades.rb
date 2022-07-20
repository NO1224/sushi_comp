class CreateGrades < ActiveRecord::Migration[6.0]
  def change
    create_table :grades do |t|
      t.references :user, null: false, foreign_key: true
      t.integer    :count, null: false
      t.timestamps
    end
  end
end
