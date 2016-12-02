get '/mountains/:mountain_id' do
  @mountain = MountainStation.find(params[:mountain_id])
  @temp_f = @mountain.current_observation["temp_f"]
  @temp_c = @mountain.current_observation["temp_c"]
  p @xml_doc = Nokogiri::XML(open("http://www.myweather2.com/developer/weather.ashx?uac=G2etkq56ct&uref=714c6b47-8cb0-4925-a4c1-88118d68d76d"))
  if !@temp_f || !@temp_c
    "Sorry, server issues"
  else
    erb :'mountains/show'
  end
end
