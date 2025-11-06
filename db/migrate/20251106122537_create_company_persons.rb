class CreateCompanyPersons < ActiveRecord::Migration[8.1]
  def change
    create_table :company_persons do |t|
      t.belongs_to :company, null: false, foreign_key: true
      t.belongs_to :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
