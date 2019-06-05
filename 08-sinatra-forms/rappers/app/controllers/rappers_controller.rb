class RappersController < ApplicationController

#index action
  get '/rappers' do
    @rappers = Rapper.all
    erb :"rappers/index"
  end

  #new action
  get '/rappers/new' do
    erb :"rappers/new"
  end

  #edit action is responsible for rendering our edit page
  get '/rappers/:id/edit' do
    @rapper = Rapper.find(params[:id])
    erb :"rappers/edit"
  end

  #create action is responsible for receiving the info from our edit page and updating the rapper
  patch '/rappers/:id' do
    @rapper = Rapper.find(params[:id])
    @rapper.update(name: params[:name], age: params[:age], fire: params[:fire])
    redirect to "/rappers/#{@rapper.id}"
  end

  #show action
  get '/rappers/:id' do
    @rapper = Rapper.find(params[:id])
    erb :"rappers/show"
  end

#create action
  post '/rappers' do
    rapper = Rapper.create(name: params[:name], age: params[:age], fire: params[:fire])
    redirect "/rappers/#{rapper.id}"
  end

end
