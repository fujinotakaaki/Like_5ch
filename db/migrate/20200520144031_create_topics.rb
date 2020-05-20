class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.string :title
      t.integer :responses_count, default: 0

      t.timestamps null: false
    end
  end
end
