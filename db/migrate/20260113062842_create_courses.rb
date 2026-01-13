class CreateCourses < ActiveRecord::Migration[7.1]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :code

      t.timestamps
    end
    add_index :courses, :code, unique: true
  end
end
