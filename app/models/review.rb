class Review < ApplicationRecord
  belongs_to :user
  belongs_to :parttime_job
end
