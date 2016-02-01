class Company < ActiveRecord::Base
  mount_uploader :logo, LogoUploader
  has_many :jobs
  belongs_to :user
  validates :name, :location, :mail, :phone, :logo, presence: true
  validates :name, uniqueness: true

  def name=(s)
    super s.capitalize
  end

  def premium?
    jobs.count > 5
  end

  def jobs_active
    jobs.where("created_at > ?", 90.days.ago)
  end
end
