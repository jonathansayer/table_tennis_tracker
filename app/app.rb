require 'sinatra/base'
require './app/data_mapper_setup'
require './lib/game.rb'

class Table_Tennis < Sinatra::Base
  set :views, proc{ File.join(root, 'views')}
  enable :sessions

  get '/' do
    erb :'users/new'
  end

  get '/users/new' do
    User.create(name: params[:name], score: 0)
    @users = User.all
    erb :'/users/users'
  end

  get '/tournament/new' do
    erb :'tournament/new'
  end

  post '/tournament' do
    p session[:names] ||= params[:username]
    redirect '/tournament/start'
  end

  get '/tournament/start' do
    @ids = []
    session[:names].each do |username|
      @ids << User.all(name: username)[0].id
    end
    # your game logic goes here
    erb :'tournament/start'
  end
#   post '/users' do
#     @user = User.new( name: params[:name])
#     if @user.save
#       session[:user_id] = @user.id
#       redirect to('/')
#     else
#       flash.now[:errors] = @user.errors.full_messages
#       erb :'users/new'
#     end
#   end

# helpers do
#   def current_user
#     User.get(session[:user_id])
#   end

  get '/table' do
    game = Game.new(['David', 'Kirsten', 'Jonathan', 'Natalia', 1, 2, 3, 4, 6])
    @players = game.current_round
    @table = game.all_rounds
    erb :'/table/view'
  end

end
