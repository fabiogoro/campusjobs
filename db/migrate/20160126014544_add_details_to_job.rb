class AddDetailsToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :description, :string
    add_column :jobs, :category, :string
  end
end
