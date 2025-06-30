class CreateParttimeJobs < ActiveRecord::Migration[8.0]
  def change
    create_table :parttime_jobs do |t|
      t.string :name
      t.string :category

      t.timestamps
    end
  end
end
