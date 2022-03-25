class GemFilesController < ApplicationController

  def index
    @gem_detail = params[:gem_detail]
  end

  def new
    @gem_file = GemFile.new
  end

  def create
    if params[:gem_file].present?
      file       = params[:gem_file]["file"]
      gem_detail = get_gem_detail(file)
      if gem_detail.present?
        redirect_to action: index, gem_detail: gem_detail
      else
        flash[:notice] = 'Uploaded file is invalid, please upload a valid file Gemfile'
        redirect_to root_path
      end
    else
      flash[:notice] = 'Please Upload a valid file'
      redirect_to root_path
    end
  end

  private

  def get_gem_detail(file)
    gem_detail = {}
    File.open(file).each do |line|
      gem_row = line.chomp.split(' ')

      next unless gem_row.first == 'gem'

      gem_name    = get_gem_name(gem_row)
      description = GetGemInfoService.new(gem_name).gem_description # get gem description to service
      # store gem detail in hash
      gem_detail[gem_name.to_sym] = description
    end
    gem_detail
  end

  def get_gem_name(gem_row)
    gem_full_name = gem_row.second
    split_by      = gem_full_name.include?("\"") ? "\"" : "'"

    gem_full_name.split(split_by)[1] # get gem_name to gemfile row
  end

end
