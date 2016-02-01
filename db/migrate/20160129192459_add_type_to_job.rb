class AddTypeToJob < ActiveRecord::Migration
  def change
    add_reference :jobs, :contract_type, index: true, foreign_key: true
  end
end
