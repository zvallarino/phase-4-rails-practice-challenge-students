class StudentsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :handle_error


  def index 
  student = Student.all 
  render json: student, status: :ok
  end
  
  def create 
  student = Student.create!(student_params)
  render json: student, status: :created
  end

  def update
  student = find_student
  student.update(student_params)
  render json: student, status: :ok
  end 

  def destroy
    student = find_student
    student.destroy
    head :no_content
  end 

  private

  def find_student
    Student.find(params[:id])
  end 

  def student_params
    params.permit(:name, :major, :age, :instructor_id)
  end

  def handle_error
    render json: {error:"you got this"}, status: :not_found
  end
end
