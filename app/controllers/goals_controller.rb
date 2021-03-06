class GoalsController < ApplicationController
  before_filter :authenticate_user!
  # GET /goals
  # GET /goals.json
  def index
    @goals = current_user.goals.where(archived: false)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @goals }
    end
  end

  def time
    unless params[:from]
      render "picktime"
      return
    end
    from = params[:from]
    to = params[:to]
    @temp = {}
    @goals =  current_user.goals.where(archived: false)

    @goals.each do |goal|
      tmp = goal.timelets.select('sum(duration) as duration').where('duration > 0').where('timelets.from' => Date.strptime(from, '%Y-%m-%d').beginning_of_day .. Date.strptime(to, '%Y-%m-%d').end_of_day)
      @temp[goal.name] = tmp.first.duration
    end
    render "timespent"
  end

  # GET /goals/1
  # GET /goals/1.json
  def show
    @goal = Goal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @goal }
    end
  end

  # GET /goals/new
  # GET /goals/new.json
  def new
    @goal = Goal.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @goal }
    end
  end

  # GET /goals/1/edit
  def edit
    @goal = Goal.find(params[:id])
  end

  # GET /goals/1/tasks
  def tasks
    @tasks = Goal.find(params[:goal_id]).tasks.where(archived: false)
    respond_to do |format|
      format.json { render json: @tasks }
    end
  end

  # POST /goals
  # POST /goals.json
  def create
    @goal = Goal.new :name => params[:name], :user => current_user, :position => params[:position], :archived => params[:archived]

    respond_to do |format|
      if @goal.save
        format.html { redirect_to @goal, notice: 'Goal was successfully created.' }
        format.json { render json: @goal, status: :created, location: @goal }
      else
        format.html { render action: "new" }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /goals/1
  # PUT /goals/1.json
  def update
    @goal = Goal.find(params[:id])
    to_update = { :name => params[:name], :position => params[:position], :archived => params[:archived] }

    respond_to do |format|
      if @goal.update_attributes(to_update)
        format.html { redirect_to @goal, notice: 'Goal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goals/1
  # DELETE /goals/1.json
  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy

    respond_to do |format|
      format.html { redirect_to goals_url }
      format.json { head :no_content }
    end
  end
end
