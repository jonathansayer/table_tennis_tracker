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
    p session[:names] ||= params[:username]
    redirect '/tournament/start'
  end

  get '/tournament/start' do
    @ids = []
    session[:names].each do |username|
      @ids << User.all(name: username)[0].id
    end
    erb :'tournament/start' #??????
  end

  get '/table' do
    game = Game.new(['David', 'Kirsten', 'Jonathan', 'Natalia', 1, 2, 3, 4, 6])
    @players = game.current_round
    @table = game.all_rounds
    erb :'/table/view'
  end

end

