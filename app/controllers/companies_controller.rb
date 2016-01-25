class CompaniesController < ApplicationController

  def show
    @company = Company.find(params[:id])
    @companies = Company.all
    @category = Category.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to @company
    else
      render new_company_path
    end
  end

  def edit
    @company = Company.find(params[:id])
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
      params.require(:company).permit(:name,:location,:mail,:phone)
    end
end
