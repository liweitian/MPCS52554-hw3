class SessionsController < ApplicationController

  def destroy
    if session["user_id"].present?
        reset_session
        redirect_to "/", notice: "sign out successed"
    else
       redirect_to "/"
    end
    
    
  end

  def new
      if session["user_id"].present?
         user = User.find_by(id:session["account"])
         if user.present?
          redirect_to "/users/#{user.id}"
         end
      end
  end

  def create
    user = User.find_by(account: params["account"])
    if user.present?
      if user.password == params["password"]
        session["user_id"] = user.id
        redirect_to "/users/#{user.id}"
      else
        redirect_to "/login", notice: "account or password invalid"
      end
    else
      redirect_to "/login"
    end
  end
end
