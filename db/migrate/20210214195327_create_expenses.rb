class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.date :date
      t.string :provider
      t.string :amount
      t.string :url
      t.references :congressman, null: false, foreign_key: true

      t.timestamps
    end
  end
end
