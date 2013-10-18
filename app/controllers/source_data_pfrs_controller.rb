class SourceDataPfrsController < ApplicationController
  before_action :set_source_data_pfr, only: [:show, :edit, :update, :destroy]

  # GET /source_data_pfrs
  # GET /source_data_pfrs.json
  def index
    @source_data_pfrs = SourceDataPfr.all
  end

  # GET /source_data_pfrs/1
  # GET /source_data_pfrs/1.json
  def show
  end

  # GET /source_data_pfrs/new
  def new
    @source_data_pfr = SourceDataPfr.new
  end

  # GET /source_data_pfrs/1/edit
  def edit
  end

  # POST /source_data_pfrs
  # POST /source_data_pfrs.json
  def create
    @source_data_pfr = SourceDataPfr.new(source_data_pfr_params)

    respond_to do |format|
      if @source_data_pfr.save
        format.html { redirect_to @source_data_pfr, notice: 'Source data pfr was successfully created.' }
        format.json { render action: 'show', status: :created, location: @source_data_pfr }
      else
        format.html { render action: 'new' }
        format.json { render json: @source_data_pfr.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /source_data_pfrs/1
  # PATCH/PUT /source_data_pfrs/1.json
  def update
    respond_to do |format|
      if @source_data_pfr.update(source_data_pfr_params)
        format.html { redirect_to @source_data_pfr, notice: 'Source data pfr was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @source_data_pfr.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /source_data_pfrs/1
  # DELETE /source_data_pfrs/1.json
  def destroy
    @source_data_pfr.destroy
    respond_to do |format|
      format.html { redirect_to source_data_pfrs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_source_data_pfr
      @source_data_pfr = SourceDataPfr.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def source_data_pfr_params
      params.require(:source_data_pfr).permit(:coach, :year, :age, :level, :employer, :role)
    end
end
