class CreatePlans < ActiveRecord::Migration[5.0]
  def change
    create_table :plans do |t|
      t.user :references
      t.text :books
      t.date :finish_by

      t.timestamps
    end
  end
end
