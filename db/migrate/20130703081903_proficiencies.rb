class Proficiencies < ActiveRecord::Migration
  def change
    create_table :proficiencies do |t|
      t.integer :user_id
      t.integer :skill_id
      t.integer :experience
      t.boolean :formal

      t.timestamps
    end
  end
end
