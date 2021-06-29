class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth
  before_action :authenticate_user!, except:[:destroy]

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :full_width_surname, :full_width_name, :birthday, :surname_yomigana,:name_yomigana])
  end

  def item_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end

  def create
    @user = Room.find(params[:user_id])
    @message = @user.messages.new(new_params)
    if @message.save
      redirect_to new_itme_path(@user)
    else
      @messages = @user.messages.includes(:user)
      render :new
    end
  end
end
