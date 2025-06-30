class ParttimeJobsController < ApplicationController
  before_action :set_parttime_job, only: %i[ show edit update destroy ]

  # GET /parttime_jobs or /parttime_jobs.json
  def index
    @parttime_jobs = ParttimeJob.all
  end

  # GET /parttime_jobs/1 or /parttime_jobs/1.json
  def show
  end

  # GET /parttime_jobs/new
  def new
    @parttime_job = ParttimeJob.new
  end

  # GET /parttime_jobs/1/edit
  def edit
  end

  # POST /parttime_jobs or /parttime_jobs.json
  def create
    @parttime_job = ParttimeJob.new(parttime_job_params)

    respond_to do |format|
      if @parttime_job.save
        format.html { redirect_to @parttime_job, notice: "Parttime job was successfully created." }
        format.json { render :show, status: :created, location: @parttime_job }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @parttime_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parttime_jobs/1 or /parttime_jobs/1.json
  def update
    respond_to do |format|
      if @parttime_job.update(parttime_job_params)
        format.html { redirect_to @parttime_job, notice: "Parttime job was successfully updated." }
        format.json { render :show, status: :ok, location: @parttime_job }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @parttime_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parttime_jobs/1 or /parttime_jobs/1.json
  def destroy
    @parttime_job.destroy!

    respond_to do |format|
      format.html { redirect_to parttime_jobs_path, status: :see_other, notice: "Parttime job was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parttime_job
      @parttime_job = ParttimeJob.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def parttime_job_params
      params.expect(parttime_job: [ :name, :category ])
    end
end
