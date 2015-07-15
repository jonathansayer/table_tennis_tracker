require 'sinatra/base'
require './data_mapper_setup'

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

end 