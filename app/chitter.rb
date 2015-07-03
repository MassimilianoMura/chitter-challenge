require 'sinatra/base'
require 'data_mapper'
require_relative 'data_mapper_setup'

class CHITTERchallenge < Sinatra::Base

  set :views, proc { File.join(root, '..', 'views') }

  enable :sessions

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps'
  end

  post '/peeps' do
    new_peep = Peep.new(message: params[:peep],
                        date: Time.now)
    new_peep.save
    redirect '/peeps'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end



# '/peeps/:id'
