class SessionsController < Devise::SessionsController
  def after_sign_in_path_for(resource)
    logger.info { "DEBUG: START: #{session.to_yaml} STOP" }
    #super
    session[:user_return_to]
  end
end

