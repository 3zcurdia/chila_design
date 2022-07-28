class CreateBusinesses < ActiveRecord::Migration[7.0]
  def change
    create_table :businesses do |t|
      t.string :name, null: false
      t.references :industry
      t.string :address
      t.decimal :latitude
      t.decimal :longitude
      t.string :url

      t.timestamps
    end
  end
end
