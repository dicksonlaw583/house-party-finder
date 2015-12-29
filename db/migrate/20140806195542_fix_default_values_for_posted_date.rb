class FixDefaultValuesForPostedDate < ActiveRecord::Migration
  def change
    change_column :parties, :posted_date, :datetime, :default => Time.now
  end
end
