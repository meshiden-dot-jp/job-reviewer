class ParttimeJobsController < ApplicationController
  before_action :set_parttime_job, only: %i[ show edit update destroy ]
  before_action :require_login, only: %i[create edit update destroy]

  # GET /parttime_jobs or /parttime_jobs.json
  def index
    if params[:category].present?
      @parttime_jobs = ParttimeJob.where(category: params[:category])
    else
      @parttime_jobs = ParttimeJob.all
    end
  end

  # GET /parttime_jobs/1 or /parttime_jobs/1.json
  def show
    @review = Review.new
    @reviews = @parttime_job.reviews.includes(:user)
  end

  # GET /parttime_jobs/new
  def new
    @parttime_job = ParttimeJob.new
    @parttime_job.category = params[:category] if params[:category].present?
  end

  # GET /parttime_jobs/1/edit
  def edit
  end

  # POST /parttime_jobs or /parttime_jobs.json
  def create
    @parttime_job = ParttimeJob.new(parttime_job_params)

    respond_to do |format|
      if @parttime_job.save
        format.html { redirect_to @parttime_job, notice: "シゴト作成成功" }
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
        format.html { redirect_to @parttime_job, notice: "シゴト更新成功" }
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
      format.html { redirect_to parttime_jobs_path, status: :see_other, notice: "シゴト削除成功" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parttime_job
      @parttime_job = ParttimeJob.find(params[:id])
    end

    def parttime_job_params
      params.require(:parttime_job).permit(:name, :category)
    end

    def require_login
      unless logged_in?
        redirect_to login_path, alert: "ログインするとおシゴトを追加できます。"
      end
  end
end
