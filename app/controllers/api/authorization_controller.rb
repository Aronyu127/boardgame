class Api::AuthorizationController < Api::BaseController

  def log_in
    @user = user_signed_in? ? current_user : nil
    fb_data = User.get_fb_data(params[:access_token]) if params[:access_token]
    fb_data[:provider] = 'facebook'
    context = UserAuthContext.new(fb_data, @user)
    if result = context.perform
      sign_in(result[:user])
    else
      respond_error('登入失敗', 404)
    end
  end

  def log_out
  end

end
