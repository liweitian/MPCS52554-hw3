require "base64"
class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create

    if(User.find_by(account: params["account"]) == nil)
      @user = User.new
      @user.seller = params["seller"]
      @user.account = params["account"]
      @user.password = params["password"]
      @user.APIkey = Base64.encode64(params["account"])[0..-2]
      if @user.save
        redirect_to "/", notice: "please login"
      end
    else
      redirect_to "/signup", notice: "this account is occupied"
    end
    
  end

  def index
      @user = User.find_by(id: params["id"])
      #@urls = Url.where(user_id:  params["id"])
  end

  def delete
      User.delete(params["id"])
      reset_session
      redirect_to "/"
  end

  def checkAPIkey
      user = User.find_by(APIkey: params["apiKey"])
      if user == nil
          render json: {}, status: 401
      else
          render json: "success"
      end
  end
end
