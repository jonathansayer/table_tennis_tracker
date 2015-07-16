require 'sinatra/base'
require './app/data_mapper_setup'
require './lib/game.rb'

class Table_Tennis < Sinatra::Base
  set :views, proc{ File.join(root, 'views')}
  enable :sessions

  get '/' do
    erb :'users/new'
  end

  get '/users/table' do
    User.create(name: params[:name], score: 0)
    @users = User.all.sort_by{|user| user.score}.reverse
    erb :'/users/table'
  end

  get '/tournament/new' do
    erb :'tournament/new'
  end

  post '/tournament' do
    session[:names] = params[:username]
  end

  get '/tournament/start' do
    @ids = []
    session[:names].each do |username|
      @ids << username
    end
    erb :'tournament/start' #??????
  end

  get '/table' do
    p session[:names]
    game = Game.new(session[:names])
    @players = game.current_round
    @table = game.all_rounds
    erb :'/table/view'
  end

end

