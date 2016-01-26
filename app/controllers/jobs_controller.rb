class JobsController < ApplicationController
  before_filter :authorize
  
  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
    @companies = Company.all
    @categories = Category.all
  end

  def edit
    @job = Job.find(params[:id])
    unless @job.active?
      redirect_to @job
    else
      @companies = Company.all
      @categories = Category.all
    end
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to @job
    else
      @categories = Category.all
      @companies = Company.all
      render new_job_path
    end
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to @job
    else
      @categories = Category.all
      @companies = Company.all
      render edit_job_path
    end
  end

  private
    def job_params
      params.require(:job).permit(:title, :location, :company_id, :description, :category_id, :featured)
    end
end
