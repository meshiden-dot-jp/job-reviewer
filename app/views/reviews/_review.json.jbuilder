json.extract! review, :id, :user_id, :parttime_job_id, :rating, :content, :image, :created_at, :updated_at
json.url review_url(review, format: :json)
