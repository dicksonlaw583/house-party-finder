class AddDefaultValueForFeaturedUntil < ActiveRecord::Migration
  def change
    change_column :parties, :featured_until, :datetime, :default => Date.today
  end
end
