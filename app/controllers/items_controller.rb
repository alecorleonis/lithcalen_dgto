class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
		if current_user
    @item = Item.new
		else
		redirect_to log_in_path
		end
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)  
    respond_to do |format|
      if Item.where(:item_name => @item.item_name, :list_id => @item.list_id).count != 0
        format.html { redirect_to items_path(:list_id => @item.list_id), notice: "El item ya existe" }
      elsif @item.save
        format.html { redirect_to items_path(:list_id => @item.list_id), notice: 'El item fue creado exitosamente.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end  
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to items_path(:list_id => @item.list_id), notice: 'El item ha sido actualizado.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_path(:list_id => @item.list_id), notice: 'Item borrado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:list_id, :item_name, :item_description, :item_rating, :item_recommendation)
    end
end
