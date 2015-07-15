require 'sinatra/base'
require './data_mapper_setup'

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

end 