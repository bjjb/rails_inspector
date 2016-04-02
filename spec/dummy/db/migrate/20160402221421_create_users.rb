class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.text :profile
      t.string :crypted_password
      t.string :uuid

      t.timestamps null: false
    end
  end
end
