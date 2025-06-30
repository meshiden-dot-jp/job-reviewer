require "application_system_test_case"

class ParttimeJobsTest < ApplicationSystemTestCase
  setup do
    @parttime_job = parttime_jobs(:one)
  end

  test "visiting the index" do
    visit parttime_jobs_url
    assert_selector "h1", text: "Parttime jobs"
  end

  test "should create parttime job" do
    visit parttime_jobs_url
    click_on "New parttime job"

    fill_in "Category", with: @parttime_job.category
    fill_in "Name", with: @parttime_job.name
    click_on "Create Parttime job"

    assert_text "Parttime job was successfully created"
    click_on "Back"
  end

  test "should update Parttime job" do
    visit parttime_job_url(@parttime_job)
    click_on "Edit this parttime job", match: :first

    fill_in "Category", with: @parttime_job.category
    fill_in "Name", with: @parttime_job.name
    click_on "Update Parttime job"

    assert_text "Parttime job was successfully updated"
    click_on "Back"
  end

  test "should destroy Parttime job" do
    visit parttime_job_url(@parttime_job)
    click_on "Destroy this parttime job", match: :first

    assert_text "Parttime job was successfully destroyed"
  end
end
