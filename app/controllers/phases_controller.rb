class PhasesController < ApplicationController
  before_action :set_phase, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /phases
  # GET /phases.json
  def index
    @phases = Phase.all
  end

  # GET /phases/1
  # GET /phases/1.json
  def show
    # $phase_url = @phase
  end

  # GET /phases/new
  def new
    @phase = Phase.new
    if $board_url
      @phase.id_board = $board_url.id
    end
    @phase.user_email = current_user.email
  end

  # GET /phases/1/edit
  def edit
  end

  # POST /phases
  # POST /phases.json
  def create
    @phase = Phase.new(phase_params)

    respond_to do |format|
      if @phase.save
        if $board_url
          format.html { redirect_to $board_url, notice: 'Phase was successfully created.' }
        else
          format.html { redirect_to @phase, notice: 'Phase was successfully created.' }
        end
        format.json { render :show, status: :created, location: @phase }
      else
        format.html { render :new }
        format.json { render json: @phase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phases/1
  # PATCH/PUT /phases/1.json
  def update
    respond_to do |format|
      if @phase.update(phase_params)
        if $board_url
          format.html { redirect_to  $board_url, notice: 'Phase was successfully updated.' }
        else
          format.html { redirect_to  @phase, notice: 'Phase was successfully updated.' }
        end
        format.json { render :show, status: :ok, location: @phase }
      else
        format.html { render :edit }
        format.json { render json: @phase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phases/1
  # DELETE /phases/1.json
  def destroy
    @phase.destroy
    respond_to do |format|
      if $board_url
        format.html { redirect_to $board_url, notice: 'Phase was successfully destroyed.' }
      else
        format.html { redirect_to phases_url, notice: 'Phase was successfully destroyed.' }
      end
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phase
      @phase = Phase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def phase_params
      params.require(:phase).permit(:name, :id_board, :user_email)
    end
end
