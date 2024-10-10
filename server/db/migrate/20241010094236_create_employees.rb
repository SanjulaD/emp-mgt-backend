class CreateEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :employees do |t|
      t.string :first_name, null: false, limit: 50
      t.string :last_name, null: false, limit: 50
      t.string :email, null: false, limit: 100
      t.string :number, null: false, limit: 15
      t.string :gender, null: false, limit: 1
      t.string :photo, limit: 255

      t.timestamps
    end
  end
end
