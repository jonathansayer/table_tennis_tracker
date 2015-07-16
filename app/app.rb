require 'sinatra/base'
require './app/data_mapper_setup'
require './lib/game.rb'

class Table_Tennis < Sinatra::Base
  set :views, proc{ File.join(root, 'views')}

  get '/' do
    erb :'users/new'
  end

  get '/users/table' do
    User.create(name: params[:name], score: 0)
    @users = User.all.sort_by{|user| user.score}.reverse
    erb :'/users/table'
  end

  get '/tournament/new' do
    @players = User.all
    erb :'tournament/new'
  end

  post '/tournament' do
    $game = Game.new(params[:username])
  end

  get '/table' do
    @table = $game.update_tournament_table
    erb :'/table/view'
  end

  post '/table' do
    victor = params[:winner]
    $game.winner(victor)
    @table = $game.update_tournament_table
    # user = User.first(:name => winner)
    # user.update(:score => user.score + 1)
    erb :'/table/view'
  end

  post '/update_round' do
    $game.update_rounds
    redirect '/table'
  end

end