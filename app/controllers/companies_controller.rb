class CompaniesController < ApplicationController
  before_action :authenticate_user!, except: :show

  def show
    @company = Company.find(params[:id])
    @companies = Company.all
    @category = Category.all
    @contract_types = ContractType.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    @company.user = current_user
    if @company.save
      redirect_to @company
    else
      render new_company_path
    end
  end

  def edit
    @company = Company.find(params[:id])
    unless @company.user == current_user
      redirect_to root_path, alert: "User #{current_user.email} can't edit #{@company.name}. This company belongs to another user."
    end
  end

  def update
    @company = Company.find(params[:id])
    if @company.update(company_params)
      redirect_to @company
    else
      render edit_company_path
    end
  end

  private
    def company_params
      params.require(:company).permit(:name,:location,:mail,:phone,:logo,:logo_cache)
    end
end
