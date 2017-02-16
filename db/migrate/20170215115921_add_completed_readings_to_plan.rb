class AddCompletedReadingsToPlan < ActiveRecord::Migration[5.0]
  def change
    add_column :plans, :completed_readings, :text
  end
end
