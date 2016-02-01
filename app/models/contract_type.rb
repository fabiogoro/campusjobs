class ContractType < ActiveRecord::Base
  has_many :jobs
  validates :name, presence: true
  validates :name, uniqueness: true

  def name=(s)
    super s.capitalize
  end

  def jobs_active
    jobs.where("created_at > ?", 90.days.ago)
  end
end
