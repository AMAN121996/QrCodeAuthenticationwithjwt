# app/controllers/qr_code_controller.rb
require "rqrcode"

class QrCodeController < ApplicationController

  def generate_qr_code

    if current_user
      token = TokenService.encode(user_id: current_user.id)

      # Generate a URL for login using the user's authentication token
      login_url = login_url(token:token)

      # Generate QR code for the login URL
      qrcode = RQRCode::QRCode.new(login_url, size: 12, level: :h)

      # Send the QR code as PNG image
      send_data qrcode.as_png.to_s, type: 'image/png', disposition: 'inline'
    else
      @error = 'Invalid token'
    end
  end

end
