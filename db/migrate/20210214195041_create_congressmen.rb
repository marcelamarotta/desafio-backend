class CreateCongressmen < ActiveRecord::Migration[6.0]
  def change
    create_table :congressmen do |t|
      t.string :name
      t.string :uf
      t.string :id_cadastro

      t.timestamps
    end
  end
end
