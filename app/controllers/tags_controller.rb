class TagsController < ApplicationController

  respond_to :js

  before_action :authenticate_user!

  def create
    @tag = ActsAsTaggableOn::Tag.create(:name=>params[:name], :active=>:false)
    @listing = Listing.find(params[:list_id])
    @listing.tags << @tag
  end

  def approve
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
    @tag.active = true
    @tag.save
  end

  def edit
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
    @categories = Category.all
    @tags = ActsAsTaggableOn::Tag.all
  end

  def destroy
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
    @tag.destroy
  end

  def autocomplete
    @tags = ActsAsTaggableOn::Tag.where("name LIKE (?)","%#{params[:q]}%")
    respond_to do |format|
      format.json { render :json => @tags.collect{|tag| {:id => tag.name, :name => tag.name}} }
    end
  end

  private

  def listing_params
    params.require(:listing).permit(:user_id, :title, :description, :address, :latitude,:longitude, :city, :zipcode, :website, :phone, :email, :tag_list, list_ids:[])
  end
end
