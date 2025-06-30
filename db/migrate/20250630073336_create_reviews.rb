class CreateReviews < ActiveRecord::Migration[8.0]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :parttime_job, null: false, foreign_key: true
      t.integer :rating
      t.text :content
      t.string :image

      t.timestamps
    end
  end
end
