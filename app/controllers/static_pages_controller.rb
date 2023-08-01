

class StaticPagesController < ApplicationController 
    # require 'flickr'

    def search 
        
    end 

    def show 
        
        flickr = Flickr.new(ENV["FLICKR_API_KEY"], ENV["FLICKR_SECRET_KEY"])
        photos = flickr.photos.search(user_id: params[:user_id])
        @photo_urls = []
        photos.each do |photo|
            id = photo.id 
            secret = photo.secret 
            info = flickr.photos.getInfo(photo_id: id, secret: secret)
            @photo_urls << Flickr.url(info) 
        end
        
    end
end 