class FixDefaultValueForEnded < ActiveRecord::Migration
  def change
    change_column :parties, :ended, :boolean, :default => false
  end
end
