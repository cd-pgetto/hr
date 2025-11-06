class CreateEmployment < ActiveRecord::Migration[8.1]
  def change
    create_enum :employment_type, %w[employee contractor]
    create_table :employments do |t|
      t.belongs_to :company, null: false, foreign_key: true
      t.belongs_to :person, null: false, foreign_key: true
      t.enum :employment_type, enum_type: :employment_type, null: false

      t.timestamps
    end

    add_index :employments, [:company_id, :person_id], unique: true
    add_index :employments, [:person_id, :employment_type]
  end
end
