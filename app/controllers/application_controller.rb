class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
  
  def require_login
    unless logged_in?
      redirect_to login_path, alert: "ログインが必要です"
    end
  end

  def require_owner
    review = Review.find(params[:id])
    unless review.user == current_user
      redirect_to reviews_path, alert: "他の人のレビューは編集できません"
    end
  end
end

