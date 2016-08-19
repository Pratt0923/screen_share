class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    @user = User.where(email: request.env["omniauth.auth"].info.email).first
    unless @user
      @user = User.new(
      email: request.env["omniauth.auth"].info.email,
      password: Devise.friendly_token[0,20],
      token: request.env["omniauth.auth"].credentials.token,
      uid: request.env["omniauth.auth"].uid
      #TODO need to add columns to user db for token and uid
      )
      @user.save
      sign_in @user
      redirect_to chat_rooms_path
    else
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      sign_in @user
      redirect_to chat_rooms_path
    end
  end
end
