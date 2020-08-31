class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :test_service

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def test_service
    receipt = Receipt.last

    text = ImageReaderService.call(receipt.photo.key)

    @result = TextParserService.new(text).call
  end
end
