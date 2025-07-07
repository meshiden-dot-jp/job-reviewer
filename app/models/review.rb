class Review < ApplicationRecord
  belongs_to :user
  belongs_to :parttime_job
  validates :rating, presence: true
end
