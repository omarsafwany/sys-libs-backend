class PackagesController < ApplicationController
  protect_from_forgery with: :null_session
  require 'rbconfig'

  def index
    @packages = Package.all
  end

  def new
    @package = Package.new
  end

  def create
    @package = Package.new(package_params)
    @package.save
    if params[:package][:dependencies]
      params[:package][:dependencies].each do |d|
        @dependency = Dependency.new()
        @dependency.name = d
        @dependency.package_id = @package.id
        @dependency.save
      end
    end
    if @package.save
        redirect_to packages_path
    else
        render 'new'
    end
  end

  def show
    @package = Package.find(params[:id])
  end

  def edit
    @package = Package.find(params[:id])
  end

  def update
    @package = Package.find(params[:id])
    if @package.update(package_params)
      if params[:package][:dependencies]
        @package.dependencies.destroy_all
        params[:package][:dependencies].each do |d|
          @dependency = Dependency.new()
          @dependency.name = d
          @dependency.package_id = @package.id
          @dependency.save
        end
      end
      redirect_to packages_path
    else
      render 'edit'
    end
  end

  def destroy
    @package = Package.find(params[:id])
    @package.destroy
    
    redirect_to packages_path
  end

  def search
    @packages = request[:packages]
    @os = request[:os]
    @result = []
    @packages.each do |p|
       if Package.where(name: p).where(os: @os).any?
        @pkg = Package.where(name: p).where(os: @os).first
        @result << @pkg.as_json(include:[:dependencies])
        # break
        # @result << @pkg
       end
    end
    render :json => @result
  end

  private
  def package_params
    params.require(:package).permit(:name, :os)
  end
end
