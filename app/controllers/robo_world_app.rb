require 'models/robot_master'

class RoboWorldApp < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')
  set :method_override, true

  get '/' do
    erb :dashboard
  end

  get '/robots' do
    @robots = RobotMaster.all
    erb :index
  end

  get '/robots/new_robot' do
    erb :new_robot
  end

  post '/robots' do
    RobotMaster.create(params[:robot])
    redirect '/robots'
  end

  get 'robots/:id' do
    @robot = RobotMaster.find
    erb :show_robot
  end

   
end
