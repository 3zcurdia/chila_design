class RemoveQualityName < ActiveRecord::Migration[7.0]
  def change
    remove_index :qualities, name: :index_qualities_on_name
    remove_column :qualities, :name
  end
end
