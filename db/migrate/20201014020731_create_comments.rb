class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :comment
      t.integer :user_id
      t.string :location_idinteger

      t.timestamps
    end
  end
end
