class CreateCompletedReadings < ActiveRecord::Migration[5.0]
  def change
    create_table :completed_readings do |t|
      t.references :plan
      t.text :passages
      t.integer :verse_count

      t.timestamps
    end
  end
end
