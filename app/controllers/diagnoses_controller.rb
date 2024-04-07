class DiagnosesController < ApplicationController
  def index
    diagnosis = Diagnosis.all
    render json: diagnosis, status: 200
  end

  def show
    diagnosis = Diagnosis.find(params[:id])
    render json: diagnosis, status: 200
  end

  def create
    diagnosis = Diagnosis.create(diagnosis_params)
    if diagnosis.save
      render json: diagnosis, status: 201
    else
      render json: diagnosis.errors, status: 422
    end
  end

  private

  def diagnosis_params
    params.permit(:slug, :description)
  end
end
