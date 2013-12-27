class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :access_token
      t.string :username
      t.string :name
      t.string :gender
      t.string :hometown
      t.string :location
      t.text :bio

      t.timestamps
    end
  end
end
