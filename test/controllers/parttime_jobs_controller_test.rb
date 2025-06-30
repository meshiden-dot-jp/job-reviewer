require "test_helper"

class ParttimeJobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @parttime_job = parttime_jobs(:one)
  end

  test "should get index" do
    get parttime_jobs_url
    assert_response :success
  end

  test "should get new" do
    get new_parttime_job_url
    assert_response :success
  end

  test "should create parttime_job" do
    assert_difference("ParttimeJob.count") do
      post parttime_jobs_url, params: { parttime_job: { category: @parttime_job.category, name: @parttime_job.name } }
    end

    assert_redirected_to parttime_job_url(ParttimeJob.last)
  end

  test "should show parttime_job" do
    get parttime_job_url(@parttime_job)
    assert_response :success
  end

  test "should get edit" do
    get edit_parttime_job_url(@parttime_job)
    assert_response :success
  end

  test "should update parttime_job" do
    patch parttime_job_url(@parttime_job), params: { parttime_job: { category: @parttime_job.category, name: @parttime_job.name } }
    assert_redirected_to parttime_job_url(@parttime_job)
  end

  test "should destroy parttime_job" do
    assert_difference("ParttimeJob.count", -1) do
      delete parttime_job_url(@parttime_job)
    end

    assert_redirected_to parttime_jobs_url
  end
end
