class TasksController < ApplicationController
  before_filter :authenticate_user!

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new :name => params[:name], :goal_id => params[:goal_id], :position => params[:position], :archived => params[:archived], :done => params[:done]

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])
    to_update = {:name => params[:name], :position => params[:position], :archived => params[:archived], :done => params[:done]}

    respond_to do |format|
      if @task.update_attributes to_update
        format.html { redirect_to @task, notice: 'task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end
end
