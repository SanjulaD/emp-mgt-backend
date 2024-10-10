class CreateEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :number
      t.string :gender
      t.string :photo

      t.timestamps
    end
  end
end
