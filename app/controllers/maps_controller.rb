require "find"
require "dir_ext"
require "json_ext"

class MapsController < ApplicationController
  before_action :set_map, only: [:show, :edit, :update, :destroy]

  COMMANDS = [["追加", "0"], ["削除", "1"]]
  DEFAULT_PATH = "var/1"

  # GET /maps
  # GET /maps.json
  def index
    @commands = COMMANDS
    @maps = []
    Find.find(DEFAULT_PATH) do |f|
      next if FileTest.file?(f)
      next if f == DEFAULT_PATH
      @maps << f
    end
  end

  def dir
    dir_param = params.require(:dir).permit(:command, :name, :path)
    if dir_param[:command] == "0"
      Dir.mkdir("#{DEFAULT_PATH}#{dir_param[:path]}/#{dir_param[:name]}")
    else dir_param[:command] == "1"
      DirExt.delete_dir("#{DEFAULT_PATH}#{dir_param[:path]}")
    end
    redirect_to maps_path
  end

  # GET /maps/1
  # GET /maps/1.json
  def show
  end

  # GET /maps/new
  def new
    @map = Map.new
  end

  # GET /maps/1/edit
  def edit
  end

  # POST /maps
  # POST /maps.json
  def create
    @map = Map.new(map_params)

    respond_to do |format|
      if @map.save
        format.html { redirect_to @map, notice: 'Map was successfully created.' }
        format.json { render action: 'show', status: :created, location: @map }
      else
        format.html { render action: 'new' }
        format.json { render json: @map.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maps/1
  # PATCH/PUT /maps/1.json
  def update
    respond_to do |format|
      if @map.update(map_params)
        format.html { redirect_to @map, notice: 'Map was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @map.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maps/1
  # DELETE /maps/1.json
  def destroy
    @map.destroy
    respond_to do |format|
      format.html { redirect_to maps_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_map
      @map = Map.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def map_params
      params.require(:map).permit(:project_id, :name, :path)
    end
end
