class MountainStation < ActiveRecord::Base
  validates :pws_id, :name, presence: true

  def current_observation
    W_API.conditions_for("pws: #{self.pws_id}")["current_observation"]
  end

  def current_webcam_img
    webcam = W_API.webcams_for("pws: #{self.pws_id}")
    webcam = webcam["webcams"]
    webcam[0]["CURRENTIMAGEURL"]
  end
end
