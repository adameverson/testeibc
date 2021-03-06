class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    $task_url = @task
  end

  # GET /tasks/new
  def new
    @task = Task.new
    @task.id_phase = $phase_begin
    # if $phase_url
      # @task.id_phase = $phase_url.id
    # end
    @task.user_email = current_user.email
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        if $board_url
          format.html { redirect_to $board_url, notice: 'Task was successfully created.' }
        else 
          if $phase_url
            format.html { redirect_to $phase_url, notice: 'Task was successfully created.' }
          else
            format.html { redirect_to tasks_url, notice: 'Task was successfully created.' }
          end
        end
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        if $board_url
          format.html { redirect_to $board_url, notice: 'Task was successfully updated.' }
        else 
          if $phase_url
            format.html { redirect_to $phase_url, notice: 'Task was successfully updated.' }
          else
            if $task_url
              format.html { redirect_to $task_url, notice: 'Task was successfully updated.' }
            else
              format.html { redirect_to tasks_url, notice: 'Task was successfully updated.' }
            end
          end
        end
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      if $board_url
        format.html { redirect_to $board_url, notice: 'Task was successfully destroyed.' }
      else 
        if $phase_url
          format.html { redirect_to $phase_url, notice: 'Task was successfully destroyed.' }
        else
          format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
        end
      end
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:task, :id_phase, :user_email)
    end
end
