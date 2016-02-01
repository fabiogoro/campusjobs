class Company < ActiveRecord::Base
  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "images/:style/missing.png"
  has_many :jobs
  belongs_to :user
  validates :name, :location, :mail, :phone, :logo, presence: true
  validates :name, uniqueness: true
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/
  
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
