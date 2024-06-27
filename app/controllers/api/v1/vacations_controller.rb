class Api::V1::VacationsController < ApplicationController
  before_action :set_vacation, only: [:show, :update, :destroy]
  
  def index
    @vacations = Vacation.all
    render json: @vacations
  end

  def show
    render json: @vacation
  end

  def create
    @vacation = Vacation.new(vacation_params)

    if @vacation.save
      render json: @vacation, status: :created
    else
      render json: @vacation.errors, status: :unprocessable_entity
    end
  end

  def update
    if @vacation.update(vacation_params)
      render json: @vacation
    else
      render json: @vacation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @vacation.destroy
  end

  private
    def set_vacation
      @vacation = Vacation.find(params[:id])
    end

    def vacation_params
      params.require(:vacation).permit(:employee_full_name, :start_date, :end_date)
    end
end
