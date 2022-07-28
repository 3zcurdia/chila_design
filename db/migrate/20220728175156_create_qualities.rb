class CreateQualities < ActiveRecord::Migration[7.0]
  def change
    create_table :qualities do |t|
      t.string :name, null: false
      t.string :thesis, null: false
      t.string :antithesis, null: false

      t.timestamps
    end
    add_index :qualities, :name, unique: true
  end
end
