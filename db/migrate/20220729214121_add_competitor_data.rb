class AddCompetitorData < ActiveRecord::Migration[7.0]
  def change
    add_column :competitors, :data, :jsonb, default: {}
  end
end
