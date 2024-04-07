  class ProfilesController < ApplicationController

    def index
      profile = Profile.all
      render json: profile
    end
  
    def show
      @profile = Profile.find(params[:id])
      render json: @profile
    end
  
    def update
      profile = Profile.find(params[:id])
      if profile.update(username: params[:username], profile_picture: params[:profile_picture], about_me: params[:about_me])
        render json: profile
      else
        render json: { error: "Profile not updated." }
      end
    end

    private

    def profile_params
      params.permit(:username, :profile_picture, :about_me)
    end
  end
