class HoriController < ApplicationController

  def index
    @path = params[:path]
    @files = []
    Find.find("#{DEFAULT_PATH}#{@path}") do |f|
      unless File.directory?(f)
        @files << File.basename(f, suffix = '.csv')
      end
    end
  end

  def show
    @path_f = params[:path_name]
    @path = File.dirname(@path_f)
    @csv = CSV.open("#{DEFAULT_PATH}/#{@path_f}.csv", "r")
    @header = @csv.take(1)[0]
    @body = []
    @csv.each do |row|
      @body << row
    end
  end

  def new
    @path = params[:path]
  end

  def create
    hori_param = params.require(:hori).permit(:name, :body, :path)
    File.open("#{DEFAULT_PATH}/#{hori_param[:path]}/#{hori_param[:name]}.csv", 'w'){|f|
      f.write hori_param[:body]
    }
    redirect_to maps_path
  end

end
