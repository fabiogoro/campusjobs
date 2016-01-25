class RemoveCompanyFromJob < ActiveRecord::Migration
  def change
    remove_column :jobs, :company, :string
  end
end
