class SongsController < ApplicationController

    get '/' do
        
    end

    get '/songs' do
        @songs = Song.all
        erb   :"songs/index"
    end

    get'/songs/new' do
        erb :"/songs/new"
    end

    get '/songs/:slug' do
        @song = Song.find {|song| song.slug == params[:slug]}
        erb :'/songs/show'
    end

    
    post '/songs' do 
        @song = Song.create(name: params["Name"])
        
        @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
        @song.genre_ids = params[:genres]
        @song.save
        erb :"/songs/show", locals: {message: "Successfully created song."}
        redirect "/songs/#{@song.slug}"
    end
    

    
end