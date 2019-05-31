class AddUserReferencesToBeaters < ActiveRecord::Migration[5.2]
  def change
    add_reference :beaters, :user, foreign_key: true, index: true
  end
end
