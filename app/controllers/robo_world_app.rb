
class RoboWorldApp < Sinatra::Base

  get '/' do
    erb :dashboard
  end

  post '/robots/rando-bot' do
    RobotManager.create_random(params[:robots])
    redirect '/robots'
  end

  get '/robots' do
    @robots = RobotManager.all
    erb :index
  end

  get '/robots/delete_all' do
    erb :delete_all
  end

  get '/robots/new_robot' do
    erb :new_robot
  end

  post '/robots' do
    RobotManager.create(params[:robot])
    redirect '/robots'
  end

  get '/robots/:id' do |id|
    @robot = RobotManager.find(id.to_i)
    erb :show_robot
  end

  get '/robots/:id/edit' do |id|
    @robot = RobotManager.find(id.to_i)
    erb :edit_robot
  end

  put '/robots/:id' do |id|
    RobotManager.update(id.to_i, params[:robot])
    redirect '/robots'
  end

  delete '/robots/:id' do |id|
    RobotManager.destroy(id.to_i)
    redirect '/robots'
  end

  delete '/delete_all' do
    RobotManager.delete_all
    redirect '/robots'
  end
end
