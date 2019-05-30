class AddStatusToBeaters < ActiveRecord::Migration[5.2]
  def change
    add_column :beaters, :status, :integer, default: 0, null: false
  end
end
