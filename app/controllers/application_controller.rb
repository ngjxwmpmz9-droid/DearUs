class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

   def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [
      :name, :profile, :age, :bloodtype, :zodiac, :bodyflame, :personalcolor,
      :hobby, :mbti, :lovetype, :encounter, :fashion, :descript, :image, :music_url, :fashion_image, :place, :place_image, :place_url
    ])

    devise_parameter_sanitizer.permit(:account_update, keys: [
      :name, :profile, :age, :bloodtype, :zodiac, :bodyflame, :personalcolor,
      :hobby, :mbti, :lovetype, :encounter, :fashion, :descript, :image, :music_url, :fashion_image, :place, :place_image, :place_url
    ])
  end
end