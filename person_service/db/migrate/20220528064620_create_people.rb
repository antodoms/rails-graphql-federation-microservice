class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :date_of_birth
      t.string :phone_number

      t.timestamps
    end
  end
end
