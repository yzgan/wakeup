class CreateBeaters < ActiveRecord::Migration[5.2]
  def change
    create_table :beaters do |t|
      t.string :name
      t.integer :provider
      t.string :url

      t.timestamps
    end
  end
end
