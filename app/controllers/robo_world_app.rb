require 'models'

class RoboWorldApp < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')
  set :method_override, true

  get '/' do
    erb :dashboard
  end

  get '/robots' do
    @robots = RoboMaster.all
    erb :index
  end

  get '/robots/new' do
    erb :new
  end

  post '/robots' do
    RoboMaster.create(params[:task])
    redirect '/robots'
  end

  get 'robots/:id'
  @robots = RoboMaster.find

end
