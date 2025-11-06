class CreatePeople < ActiveRecord::Migration[8.1]
  def change
    create_table :people do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.boolean :employee, null: false, default: true
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
