class Job < ActiveRecord::Base
  scope :all_active, -> {where("created_at > ?", 90.days.ago)}
  belongs_to :company
  belongs_to :category
  validates :title, presence: true

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
