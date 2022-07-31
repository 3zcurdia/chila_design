class CreateDesignBriefs < ActiveRecord::Migration[7.0]
  def change
    enable_extension("pg_trgm")
    create_table :design_briefs, id: :uuid do |t|
      t.references :business, null: false, foreign_key: true, index: true
      t.jsonb :histograms, default: {}, index: :gin

      t.timestamps
    end
  end
end
