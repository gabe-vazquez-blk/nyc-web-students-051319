class SongsController < ApplicationController

  #index action
  get "/songs" do
    @songs = Song.all
    erb :"songs/index"
  end

  #new action
  get "/songs/new" do
    erb :"songs/new"
  end

  #edit action
  get '/songs/:id/edit' do
    @song = Song.find(params[:id])
    erb :"songs/edit"
  end

  #create (update) action
  patch '/songs/:id' do
    @song = Song.find(params[:id])
    @song.update(name: params[:name], artist: params[:artist], fire: params[:fire])
    redirect to "/songs/#{@song.id}"
  end

  #show action
  get '/songs/:id' do
    @song = Song.find(params[:id])
    erb :"songs/show"
  end

  #create (new) action
  post '/songs' do
    song = Song.create(name: params[:name], artist: params[:artist], fire: params[:fire])
    redirect "/songs/#{song.id}"
  end

end
