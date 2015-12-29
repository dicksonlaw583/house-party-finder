class RemoveDefaultValueForFeaturedUntil < ActiveRecord::Migration
  def change
  	change_column :parties, :featured_until, :datetime, :default => nil
  end
end
