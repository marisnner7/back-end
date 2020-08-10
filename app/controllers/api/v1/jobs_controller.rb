class Api::V1::JobsController < ApplicationController

  skip_before_action :verify_authenticity_token
  

  def index
    jobs = Job.all

    render json: JobSerializer.new(jobs).serialized_json
  end

  def show
    job = Job.find(params[:id])

    render json: JobSerializer.new(job).serialized_json
  end

  def create
    job = Job.new(job_params)

    if job.save
      render json: JobSerializer.new(job).serialized_json

    else
      render json: { error: job.errors.messages }, status: 422
    end
  end

  def update
    job = Job.find(params[:id])

    if job.update(job_params)
      render json: JobSerializer.new(job).serialized_json

    else
      render json: { error: job.errors.messages }, status: 422
    end
  end

  def destroy
    job = Job.find(params[:id])
    if job.destroy
      head :no_content
    else
      render json: { error: job.errors.messages }, status: 422
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :gif_url)
  end
end
