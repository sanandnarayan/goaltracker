class TomatoesController < ApplicationController
  before_filter :authenticate_user!
  # GET /timelets
  # GET /timelets.json
  def index
    @timelets = current_user.timelets.where(archived: false)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @timelets }
    end
  end

  # GET /timelets/1
  # GET /timelets/1.json
  def show
    @timelet = Timelet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @timelet }
    end
  end

  # GET /timelets/new
  # GET /timelets/new.json
  def new
    @timelet = Timelet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @timelet }
    end
  end

  # GET /timelets/1/edit
  def edit
    @timelet = Timelet.find(params[:id])
  end

  # POST /timelets
  # POST /timelets.json
  def create
    @tomato = Tomato.new :from => params[:from]

    respond_to do |format|
      if @tomato.save
        format.html { redirect_to @tomato, notice: 'Timelet was successfully created.' }
        format.json { render json: @tomato, status: :created, location: @timelet }
      else
        format.html { render action: "new" }
        format.json { render json: @tomato.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /timelets/1
  # PUT /timelets/1.json
  def update
    @tomato = Tomato.find(params[:id])
    to_update = { :to => params[:to]}

    respond_to do |format|
      if @tomato.update_attributes(to_update)
        format.html { redirect_to @tomato, notice: 'Timelet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tomato.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timelets/1
  # DELETE /timelets/1.json
  def destroy
    @tomato = Tomato.find(params[:id])
    @tomato.destroy

    respond_to do |format|
      format.html { redirect_to tomatoes_url }
      format.json { head :no_content }
    end
  end  
end
