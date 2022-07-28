class CreateDimensions < ActiveRecord::Migration[7.0]
  def change
    create_table :dimensions do |t|
      t.references :dimensionable, null: false, polymorphic: true
      t.references :quality, null: false, foreign_key: true
      t.decimal :value, default: 0

      t.timestamps
    end
  end
end
