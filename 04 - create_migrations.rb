##rails db:migrate

###rails db:seed when you are done with your migrations.

class CreateMigrations < ActiveRecord::Migration[5.2]
  def change
    create_table :migrations do |t|
      t.integer :foreign_key, null: false  ##Foreign Key
      t.string :string ####256 chars. Username, Password, etc
      t.text :paragraph ####Lots of Chars. Comments, Posts, etc. Anything in a textbox
      t.float :number ### takes a decimal. 
      t.date :date ###Had us require "Date" module during Project. Need clarification
      
      t.timestamps ##Should always be here. 
    end
    add_index :migrations, :foreign_key, unique: true, null: false ###Foregn Key indexing 
                                ## unique/null schema validations.
     
  end
end
