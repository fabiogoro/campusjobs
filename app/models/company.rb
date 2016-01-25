class Company < ActiveRecord::Base
  has_many :jobs
  validates :name, presence: true

  def premium?
    jobs.count > 5
  end

  def jobs_active
    jobs.where("created_at > ?", 90.days.ago)
  end
end
