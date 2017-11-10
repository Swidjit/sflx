class AddFieldsToListing < ActiveRecord::Migration[4.2]
  def change
    add_column :listings, :active, :boolean, :default => :false
    add_column :listings, :user_id, :integer
  end
end
