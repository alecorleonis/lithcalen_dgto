class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

	def rooturl
		redirect_to lists_path(:user => current_user.id)
	end
  # GET /lists
  # GET /lists.json
  def index
    @lists = List.all
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists
  # POST /lists.json

  def create
    @list = List.new(list_params)  
    respond_to do |format|
      if List.where(:list_name => @list.list_name, :user_id => current_user.id).count != 0
        format.html { redirect_to lists_path(:user => @list.user_id), notice: "La lista ya existe." }
      elsif @list.save
        format.html { redirect_to @list, notice: 'La lista ha sido creada.' }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end  
  end
  #def create
    #@list = List.new(list_params)

    #respond_to do |format|
     # if @list.save
       # format.html { redirect_to @list, notice: 'List was successfully created.' }
      #  format.json { render action: 'show', status: :created, location: @list }
     # else
      #  format.html { render action: 'new' }
     #   format.json { render json: @list.errors, status: :unprocessable_entity }
    #  end
   # end
  #end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: 'La lista ha sido actualizada.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_path(:user => @list.user_id), notice: 'Lista borrada.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:user_id, :list_name).merge(user_id: current_user.id)
    end
end
