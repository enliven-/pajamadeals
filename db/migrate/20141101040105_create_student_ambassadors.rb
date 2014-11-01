class CreateStudentAmbassadors < ActiveRecord::Migration
  def change
    create_table :student_ambassadors do |t|
      t.string :name
      t.string :mobile
      t.string :year
      t.string :branch
      t.string :college
      t.text :q1
      t.text :q2
      t.text :q3
      t.text :q4
      t.text :q5
      t.text :q6
      t.text :q7
      t.text :q8
      t.string :f1_name
      t.string :f1_mobile
      t.string :f2_name
      t.string :f2_mobile

      t.timestamps
    end
  end
end
