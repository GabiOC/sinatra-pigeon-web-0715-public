# create your PigeonsController here
# it should inherit from ApplicationController
require 'pry'

class PigeonsController < ApplicationController
  get '/pigeons' do
    @pigeons = Pigeon.all
    erb :'pigeons/index'
  end

  get '/pigeons/new' do
    erb :'pigeons/new'
  end

  get "/pigeons/:id" do
    @pigeon = Pigeon.find_by(params[:id])
    erb :'pigeons/show'
  end

  get "/pigeons/:id/edit" do
    @pigeon = Pigeon.find_by(params[:id])
    erb :'pigeons/edit'
  end

  patch "/pigeons/:id" do
    p = Pigeon.find_by(params[:id])
    p.update(name: params[:name], color: params[:color], lives: params[:lives], gender: params[:gender])
    redirect to("/pigeons/#{params[:id]}")
  end

  post '/pigeons' do
    p = Pigeon.create(params[:pigeon])
    redirect to('/pigeons')
  end

  delete "/pigeons/:id" do
    Pigeon.delete(params[:id])
    redirect to('/pigeons')
  end
end
