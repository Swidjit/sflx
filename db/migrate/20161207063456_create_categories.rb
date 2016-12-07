class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, :required => :true
      t.string :description, :required => :true
    end
  end
end
