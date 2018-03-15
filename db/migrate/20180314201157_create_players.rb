class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :name_brief, null: false
      t.string :position, null: false
      t.integer :age, null: false
      t.string :type, null: false
    end
  end
end
