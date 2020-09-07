class QuestionsController < ApplicationController

	before_action :set_company, except: [:index, :create, :new]

  def index
    @questions = Question.all
  end

  def new
    @company = Company.new
  end

  def show
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to companies_path, notice: "Saved"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @company.update(company_params)
      redirect_to companies_path, notice: "Changes Saved"
    else
      render :edit
    end
  end


  def destroy
    # Using destroy instead delete because destroy deletes associated records
    if @company.destroy
      redirect_to companies_path, notice: "Successfully deleted #{@company.name}."
    else
      flash[:error] = "#{@company.errors.full_messages.join(', ')}"
      redirect_to company_path(@company)
    end
  end

  private

  def company_params
    params.require(:company).permit(
      :name,
      :legal_name,
      :description,
      :zip_code,
      :phone,
      :email,
      :owner_id,
    )
  end

  def set_company
    @company = Company.find(params[:id])
  end
end
