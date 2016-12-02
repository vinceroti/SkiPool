get '/mountains/:mountain_id' do

  @mountain = MountainStation.find(params[:mountain_id])
  # @xml_doc = Nokogiri::XML(open("http://www.myweather2.com/developer/weather.ashx?uac=G2etkq56ct&uref=714c6b47-8cb0-4925-a4c1-88118d68d76d"))
  current_temps = @mountain.current_observation
  if !current_temps
    "Sorry, server issues"
  else
    @mountain_video = @mountain.live_timelapse
    @temp_f = current_temps["temp_f"]
    @temp_c = current_temps["temp_c"]
    erb :'mountains/show'
  end
end
