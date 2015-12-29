class AddHostRefToParties < ActiveRecord::Migration
  def change
    add_reference :parties, :host, index: true
  end
end
