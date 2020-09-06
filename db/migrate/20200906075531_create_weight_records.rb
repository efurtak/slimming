class CreateWeightRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :weight_records do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date
      t.float :weight

      t.timestamps
    end
  end
end
