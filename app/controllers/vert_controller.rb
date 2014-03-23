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
    @path_f = params[:path_name]
    @path = File.dirname(@path_f)
    @body = File.read("#{DEFAULT_PATH}/#{@path_f}.txt")
  end

  def new
    @path = params[:path]
  end

  def edit
    @path_f = params[:path_name]
    @name = File.basename("#{DEFAULT_PATH}/#{@path_f}.txt", suffix = '.txt')
    @body = File.read("#{DEFAULT_PATH}/#{@path_f}.txt")
    @path = File.dirname(@path_f)
  end

  def create
    vert_param = params.require(:vert).permit(:name, :body, :path)
    File.open("#{DEFAULT_PATH}/#{vert_param[:path]}/#{vert_param[:name]}.txt", 'w'){|f|
      f.write vert_param[:body]
    }
    redirect_to maps_path
  end

  def update
    # TODO: ファイルが存在しない場合はエラーにする
    vert_param = params.require(:vert).permit(:name, :body, :path)
    File.open("#{DEFAULT_PATH}/#{vert_param[:path]}/#{vert_param[:name]}.txt", 'w'){|f|
      f.write vert_param[:body]
    }
    redirect_to maps_path
  end

end
