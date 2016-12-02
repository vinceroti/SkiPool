class MountainStation < ActiveRecord::Base
  validates :pws_id, :name, :latitude, :latitude, presence: true

  def current_observation
    W_API.conditions_for("pws: #{self.pws_id}")["current_observation"]
  end

  def live_image
    webcam_image_response = JSON.parse(open("https://webcamstravel.p.mashape.com/webcams/list/nearby=#{self.latitude},#{self.longitude},5?show=webcams:image",
    "X-Mashape-Key" => "z40MPygxW3mshJmuIzjgWTkV6GiXp13WFyUjsnAU30HUbmBZju").read)
    webcam_image_response["result"]["webcams"][0]["image"]["current"]["preview"]
  end


  def live_timelapse
    webcam_timelaspe_response = JSON.parse(open("https://webcamstravel.p.mashape.com/webcams/list/nearby=#{self.latitude},#{self.longitude},5?show=webcams:timelapse",
    "X-Mashape-Key" => "z40MPygxW3mshJmuIzjgWTkV6GiXp13WFyUjsnAU30HUbmBZju").read)
    first_cam = webcam_timelaspe_response["result"]["webcams"][0]
    { link: first_cam["timelapse"]["day"]["link"], title: first_cam["title"] }
  end
end
