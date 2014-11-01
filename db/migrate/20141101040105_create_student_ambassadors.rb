class CreateStudentAmbassadors < ActiveRecord::Migration
  def change
    create_table :student_ambassadors do |t|
      t.string :name
      t.string :mobile
      t.string :year
      t.string :branch
      t.string :college

      t.timestamps
    end
  end
end
