class Category < ActiveRecord::Base
  has_many :jobs

  def jobs_active
    jobs.where("created_at > ?", 90.days.ago)
  end
end
