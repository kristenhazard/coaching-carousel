class CoachEmploymentsController < ApplicationController
  before_action :set_coach_employment, only: [:show, :edit, :update, :destroy]

  # GET /coach_employments
  # GET /coach_employments.json
  def index
    @coach_employments = CoachEmployment.all.
      includes(:coach, :team).
      where("year >= 1973").
      order("coaches.name,year")

    respond_to do |format|
      format.html  { render :action => "index" }
      format.json  { render :json => @coach_employments.as_json(
                    :methods => [:coach_name, :team_name]
                )}
    end
  end

  # GET /coach_employments/1
  # GET /coach_employments/1.json
  def show
  end

  # GET /coach_employments/new
  def new
    @coach_employment = CoachEmployment.new
  end

  # GET /coach_employments/1/edit
  def edit
  end

  # POST /coach_employments
  # POST /coach_employments.json
  def create
    @coach_employment = CoachEmployment.new(coach_employment_params)

    respond_to do |format|
      if @coach_employment.save
        format.html { redirect_to @coach_employment, notice: 'Coach employment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @coach_employment }
      else
        format.html { render action: 'new' }
        format.json { render json: @coach_employment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coach_employments/1
  # PATCH/PUT /coach_employments/1.json
  def update
    respond_to do |format|
      if @coach_employment.update(coach_employment_params)
        format.html { redirect_to @coach_employment, notice: 'Coach employment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @coach_employment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coach_employments/1
  # DELETE /coach_employments/1.json
  def destroy
    @coach_employment.destroy
    respond_to do |format|
      format.html { redirect_to coach_employments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coach_employment
      @coach_employment = CoachEmployment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coach_employment_params
      params.require(:coach_employment).permit(:coach_id, :team_id, :year, :role, :age)
    end
end
