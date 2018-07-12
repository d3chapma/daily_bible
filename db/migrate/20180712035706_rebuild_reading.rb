class RebuildReading < ActiveRecord::Migration[5.2]
  def up
    drop_table :completed_readings

    create_table :readings do |t|
      t.references :plan
      t.string :book_name
      t.integer :chapter
      t.datetime :completed_at
      t.datetime :first_sent_at
      t.datetime :last_sent_at

      t.timestamps
    end
  end

  def down
    drop_table :readings

    create_table :completed_readings do |t|
      t.references :plan
      t.text :passages
      t.integer :verse_count

      t.timestamps
    end
  end
end
