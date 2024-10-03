class ApplicationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @position = Position.find(params[:position_id])
    @application = Application.new
    set_candidate
  end

  def create
    @position = Position.find(params[:position_id])
    @candidate = current_user.candidate || Candidate.create(candidate_params.merge(user: current_user))

    @application = Application.new(candidate: @candidate, position: @position, status: :pending)

    if @candidate.valid? && @application.save
      redirect_to root_path, notice: "You have successfully applied for this position."
    else

    render :new
    end
  end

  private

  def set_candidate
    if defined?(@candidate) && @candidate.present?
      # @candidate is already set; do not overwrite it
      puts "set_candidate: Preserving existing @candidate with object_id #{@candidate.object_id}"
    else
      @candidate = current_user.candidate || Candidate.new(user: current_user)
      puts "set_candidate: Setting new @candidate with object_id #{@candidate.object_id}"
    end
    # Initialize nested attributes if needed
    @candidate.trainings.build if @candidate.trainings.empty?
    @candidate.job_experiences.build if @candidate.job_experiences.empty?
  end


  def candidate_params
    params.require(:application).require(:candidate).permit(
      :cedula, :name, :desired_salary, :recommended_by,
      language_ids: [], competency_ids: [],
      trainings_attributes: [ :id, :description, :level, :start_date, :end_date, :institution, :_destroy ],
      job_experiences_attributes: [ :id, :company, :position, :start_date, :end_date, :salary, :_destroy ]
    )
  end
end
