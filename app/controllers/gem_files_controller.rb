class GemFilesController < ApplicationController
  before_action :set_gem_file, only: [:show]

  def index
    @gem_detail = params[:gem_detail]
  end

  def new
    @gem_file = GemFile.new
  end

  def create
    if params[:gem_file].present?
      @gem_file = GemFile.new(gem_file_params)

      if @gem_file.save
        redirect_to @gem_file
      else
        flash[:notice] = 'Uploaded file is invalid, please upload a valid file Gemfile'
        render 'new'
      end
    else
      flash[:notice] = 'Please Upload a valid file'
      redirect_to root_path
    end
  end

  def show
    @info = @gem_file.gem_infos
  end

  private

  def set_gem_file
    @gem_file = GemFile.find(params[:id])
  end

  def gem_file_params
    params.require(:gem_file).permit(:file)
  end
end
