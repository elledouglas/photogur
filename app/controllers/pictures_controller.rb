class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
      @most_recent_pictures = Picture.most_recent_five
      @pictures_created_in_year = Picture.pictures_created_in_year
  end

  def new
     @picture = Picture.new
   end

   def create
     @picture = Picture.new(picture_params)
     if @picture.save
       # if the picture gets saved, generate a get request to "/pictures" (the index)
       redirect_to "/pictures"
     else
       # otherwise render new.html.erb
       render :new
     end
   end
   def picture_params
     { title: params[:picture][:title], artist: params[:picture][:artist], url: params[:picture][:url] }
   end

 end
