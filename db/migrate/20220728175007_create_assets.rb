class CreateAssets < ActiveRecord::Migration[7.0]
  def change
    create_table :assets do |t|
      t.string :type
      t.string :name, null: false
      t.string :value

      t.timestamps
    end
    add_index :assets, [:type, :name], unique: true
  end
end
