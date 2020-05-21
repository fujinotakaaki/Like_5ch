class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :categorizations_count, default: 0

      # t.timestamps null: false
    end
  end
end
