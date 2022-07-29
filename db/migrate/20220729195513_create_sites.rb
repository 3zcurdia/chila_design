class CreateSites < ActiveRecord::Migration[7.0]
  def change
    remove_column :competitors, :url

    create_table :sites do |t|
      t.string :url, null: false
      t.jsonb :data, null: false, default: {}

      t.timestamps
    end
    add_index :sites, :url, unique: true
    add_column :competitors, :site_id, :bigint, foreign_key: true, index: true
  end
end
