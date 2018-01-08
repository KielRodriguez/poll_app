class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :provider
      t.string :uid

      t.timestamps null: false
    end
  end
end
