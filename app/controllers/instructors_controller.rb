class InstructorsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :handle_error


  def index 
  instructor = Instructor.all 
  render json: instructor, status: :ok
  end
  
  def create 
  instructor = Instructor.create!(instructor_params)
  render json: instructor, status: :created
  end

  def update
  instructor = find_instructor
  instructor.update(instructor_params)
  render json: instructor, status: :ok
  end 

  def destroy
    instructor = find_instructor
    instructor.destroy
    head :no_content
  end 

  private

  def find_instructor
    Instructor.find(params[:id])
  end 

  def instructor_params
    params.permit(:name)
  end

  def handle_error
    render json: {error:"you got this"}, status: :not_found
  end
  
end
