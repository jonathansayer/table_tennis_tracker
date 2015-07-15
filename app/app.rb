require 'sinatra/base'
require './app/data_mapper_setup'
require './lib/game.rb'

class Table_Tennis < Sinatra::Base
  set :views, proc{ File.join(root, 'views')}

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
    usernames = params[:usernames]
    @users = User.all(name: usernames)
    erb :'users/new'
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
    game = Game.new(['David', 'Kirsten', 'Faisal', 'Jonathan', 'Natalia'])
    @players = game.current_round
    @table = game.all_rounds
    erb :'/table/view'
  end

end
