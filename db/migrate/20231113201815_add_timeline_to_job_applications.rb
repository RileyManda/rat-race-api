class AddTimelineToJobApplications < ActiveRecord::Migration[7.1]
  def change
    add_column :job_applications, :applied_at, :date
    add_column :job_applications, :interviewing_at, :date
    add_column :job_applications, :hired_at, :date
  end
end
