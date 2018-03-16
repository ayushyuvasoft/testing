class CollagesController < ApplicationController
  def index
  @colls = Collage.all
  end

  def create
    @coll = current_user.build_collage(coll_params)
    if @coll.save
      params[:avatar].each do |file|
        @coll.photos.create(avatar: file)
      end 
      flash[:notice] = " Collage added successfully!"
      redirect_to collages_path(@coll)
    else
      redirect_to new_collage_path
    end  
  end  

  def new
    @coll = Collage.new
  end

  def edit
    @coll = Collage.find(params[:id])
  end

  def show
    @coll = Collage.find(params[:id])
  end 
          
  def update
    @coll = Collage.find(params[:id])
    @coll.photos.destroy_all if @coll.update(coll_params)
    params[:avatar].each do |file| 
     @coll.photos.create(avatar: file)
    end 
    redirect_to collages_path
  end 
          
  def destroy
    @coll = Collage.find(params[:id])
    @coll.destroy
    redirect_to collages_path
  end

  private
    def coll_params
      params.require(:collage).permit(:name, :address)
    end
end