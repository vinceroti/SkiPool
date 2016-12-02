get '/mountains/:mountain_id' do

  @mountain = MountainStation.find(params[:mountain_id])
  @temp_f = @mountain.current_observation["temp_f"]
  @temp_c = @mountain.current_observation["temp_c"]
  @xml_doc = Nokogiri::XML(open("http://www.myweather2.com/developer/weather.ashx?uac=G2etkq56ct&uref=714c6b47-8cb0-4925-a4c1-88118d68d76d"))
  if !@temp_f || !@temp_c
    "Sorry, server issues"
  else
    erb :'mountains/show'
  end
end

get '/mountains/:mountain_id/webcam' do
  @mountain = MountainStation.find(params[:mountain_id])
  response = JSON.parse(open("https://webcamstravel.p.mashape.com/webcams/list/nearby=39.5792,-105.9347,5?show=webcams:image",
    "X-Mashape-Key" => "z40MPygxW3mshJmuIzjgWTkV6GiXp13WFyUjsnAU30HUbmBZju").read)
   @webcam_image = response["result"]["webcams"][2]["image"]["current"]["preview"]

  timelaspe_response = JSON.parse(open("https://webcamstravel.p.mashape.com/webcams/list/nearby=39.5792,-105.9347,5?show=webcams:timelapse",
  "X-Mashape-Key" => "z40MPygxW3mshJmuIzjgWTkV6GiXp13WFyUjsnAU30HUbmBZju").read)
   p @timelaspe_link = timelaspe_response["result"]["webcams"][2]["timelapse"]["day"]["link"]

   erb :'webcams/show'
end
