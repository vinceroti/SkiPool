get '/mountains/:mountain_id' do
  @mountain = MountainStation.find(params[:mountain_id])
  @temp_f = @mountain.current_observation["temp_f"]
  @temp_c = @mountain.current_observation["temp_c"]
  if !@temp_f || !@temp_c
    "Sorry, server issues"
  else
    erb :'mountains/show'
  end
end
