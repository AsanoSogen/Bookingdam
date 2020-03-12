class Address < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer :user_id,		    foreign_key: true
      t.string :postal_code,		null: false
      t.string :prefectures,	  null: false
      t.string :municipalities,		null: false
      t.string :address,		      null: false
      t.string :building
      t.string :phone_number,		null: false
      t.timestamps
    end
  end
end
