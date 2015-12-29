class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.belongs_to :user
      t.belongs_to :party
      t.integer :score
      t.text :comment

      t.timestamps
    end
  end
end
