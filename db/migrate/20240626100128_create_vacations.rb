class CreateVacations < ActiveRecord::Migration[7.1]
  def change
    create_table :vacations do |t|
      t.string :employee_full_name
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
