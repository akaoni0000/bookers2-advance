class ApplicationController < ActionController::Base
		before_action :authenticate_user!, except: [:start,:about] #ログインしなかったらどの画面も表示できない、ログインしなかったらログイン画面にレダイレクトする
	    before_action :configure_permitted_parameters, if: :devise_controller?
	    def after_sign_in_path_for(resource)  #ログインした後のパス
	       user_path(resource)
		end
		protected
		def configure_permitted_parameters
		   devise_parameter_sanitizer.permit(:sign_up, keys: [:email]) #gemのデバイスではnameカラムが入っていないのでnameでもログインできるようにこのように設定する　#signupでsigninでもつかえる
		end
end