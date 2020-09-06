class AddPreferredWeightToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :preferred_weight, :float
  end
end
