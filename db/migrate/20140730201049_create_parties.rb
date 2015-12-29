class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :name
      t.integer :capacity
      t.string :address
      t.string :city
      t.string :province
      t.decimal :latitude
      t.decimal :longitude
      t.text :description
      t.datetime :posted_date
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :ended
      t.datetime :featured_until
      t.boolean :streaming
      t.boolean :private
      t.boolean :food_provided
      t.boolean :alcohol
      t.boolean :parking
      t.boolean :adult_only

      t.timestamps
    end
  end
end
