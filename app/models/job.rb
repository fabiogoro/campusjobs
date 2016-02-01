class Job < ActiveRecord::Base
  scope :all_active, -> {where("created_at > ?", 90.days.ago)}
  belongs_to :company
  belongs_to :category
  belongs_to :contract_type
  validates :title, :location, :company, :description, :category, :contract_type, presence: true
  validates :title, length: { in: 5..30 }

  def recent?
    created_at > 5.days.ago
  end

  def premium?
    company.premium?
  end

  def active?
    created_at > 90.days.ago
  end
end
