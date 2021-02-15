class AddTotalToCongressmen < ActiveRecord::Migration[6.0]
  def change
    add_column :congressmen, :total, :integer
  end
end
