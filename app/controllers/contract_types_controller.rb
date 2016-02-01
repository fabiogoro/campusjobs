class ContractTypesController < ApplicationController
  before_action :authenticate_user!, except: :show

  def show
    @contract_type = ContractType.find(params[:id])
    @companies = Company.all
    @categories = Category.all
    @contract_types = ContractType.all
  end

  def new
    @contract_type = ContractType.new
  end

  def create
    @contract_type = ContractType.new(category_params)
    if @contract_type.save
      redirect_to @contract_type
    else
      render new_contract_type_path
    end
  end

  private
    def category_params
      params.require(:contract_type).permit(:name)
    end
end
