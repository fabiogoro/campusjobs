class JobsController < ApplicationController
  before_action :authenticate_user!, except: :show

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
    @companies = current_user.companies
    @categories = Category.all
    @contract_type = ContractType.all
  end

  def edit
    @job = Job.find(params[:id])
    unless @job.company.user == current_user
      redirect_to root_path, alert: "User #{current_user.email} can't edit #{@job.company.name} jobs. This company belongs to another user."
    end
    unless @job.active?
      redirect_to @job
    end
    @companies = current_user.companies
    @categories = Category.all
    @contract_type = ContractType.all
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to @job
    else
      @categories = Category.all
      @companies = current_user.companies
      @contract_type = ContractType.all
      render new_job_path
    end
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to @job
    else
      @categories = Category.all
      @companies = current_user.companies
      @contract_type = ContractType.all
      render edit_job_path
    end
  end

  private
    def job_params
      params.require(:job).permit(:title, :location, :company_id, :description, :category_id, :contract_type_id, :featured)
    end
end
