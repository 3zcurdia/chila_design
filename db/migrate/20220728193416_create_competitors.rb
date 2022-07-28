class CreateCompetitors < ActiveRecord::Migration[7.0]
  def change
    create_table :competitors do |t|
      t.string :name
      t.references :business, null: false, foreign_key: true
      t.string :url

      t.timestamps
    end
  end
end
