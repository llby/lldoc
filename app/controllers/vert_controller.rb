class VertController < ApplicationController
  DEFAULT_PATH = "var/1"

  def index
    @path = params[:path]
    @files = []
    Find.find("#{DEFAULT_PATH}#{@path}") do |f|
      unless File.directory?(f)
        @files << File.basename(f, suffix = '.txt')
      end
    end
  end

  def show
    # dbからパスを取得する
#    @map = Map.find(params[:id])
#    @contents = File.read("#{DEFAULT_PATH}/#{@map.path}/#{@map.name}.txt")

    # list["full"]から、DEFAULT_PATHを取る
    @path = params[:path]
    @content = File.read("#{DEFAULT_PATH}/#{params[:path]}.txt")


    # 1行目を削る
#    @content = ""
#    IO.foreach("file") do |line|
#      out << line if line != xxx
#    end

  end

  def new
    @path = params[:path]
  end

  def edit
    @path = params[:path]
  end

  def create
    vert_param = params.require(:vert).permit(:name, :body, :path)
    @map = Map.new()
    @map.project_id = 1
    @map.path = vert_param[:path]
    @map.name = vert_param[:name]
    @map.save
    File.open("#{DEFAULT_PATH}/#{vert_param[:path]}/#{vert_param[:name]}.txt", 'w'){|f|
      f.puts @map.id
      f.write vert_param[:body]
    }
    redirect_to maps_path
  end




end
