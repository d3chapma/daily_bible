class RebuildPlans < ActiveRecord::Migration[5.2]
  def up
    drop_table :plans

    create_table :plans do |t|
      t.references :user
      t.string :book_name, null: false
      t.datetime :completed_at

      t.timestamps
    end
  end

  def down
    drop_table :plans

    create_table :plans do |t|
      t.references :user
      t.text :books
      t.date :finish_by
      t.text :completed_readings

      t.timestamps
    end
  end
end
