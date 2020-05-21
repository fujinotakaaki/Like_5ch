class CreateCategorizations < ActiveRecord::Migration[5.2]
  def change
    create_table :categorizations do |t|
      t.integer :topic_id, null: false
      t.integer :category_id, null: false

      # t.timestamps null: false
    end
  end
end
