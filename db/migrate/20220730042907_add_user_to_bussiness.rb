class AddUserToBussiness < ActiveRecord::Migration[7.0]
  def change
    add_column :businesses, :user_id, :bigint, foreing_key: true, index: true
  end
end
