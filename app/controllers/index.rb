get '/' do

  @mountains = MountainStation.all
  erb :index
end


