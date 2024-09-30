class ApplicationsController < ApplicationController
  before_action :authenticate_user!
  def new
    @position = Position.find(params[:position_id])
    @application = Application.new
    @candidate = current_user.candidate || Candidate.new(user: current_user)
    
    # Inicializa capacitaciones y experiencia laboral vacías
    @candidate.trainings.build if @candidate.trainings.empty?
    @candidate.job_experiences.build if @candidate.job_experiences.empty?
  end

  def create
    @position = Position.find(params[:position_id])
    @candidate = current_user.candidate || Candidate.create(candidate_params.merge(user: current_user))
  
    @application = Application.new(candidate: @candidate, position: @position, status: :pending)
    puts "Parameters: #{params.inspect}" 

    if @application.save
      redirect_to root_path, notice: "You have successfully applied for this position."
    else
       puts "Candidate errors: #{@candidate.errors.full_messages}"
    puts "Application errors: #{@application.errors.full_messages}"
      render :new
    end
  end

  private

  def candidate_params
    params.require(:application).require(:candidate).permit(
      :cedula, :name, :desired_salary, :recommended_by,
      language_ids: [], competency_ids: [],
      trainings_attributes: [:id, :description, :level, :start_date, :end_date, :institution, :_destroy],
      job_experiences_attributes: [:id, :company, :position, :start_date, :end_date, :salary, :_destroy]
    )
  end
end
