class SessionsController < ApplicationController


    def login_club
      @club = Club.
        find_by(email: params[:email].downcase).
        try(:authenticate, params[:password])

      if @club
        session[:club_id] = @club.id
        redirect_to club_seasons_path(@club), flash:{success:'you are logged in'}
      else
        redirect_to root_path, flash:{alert:"please try to login again"}
      end
    end

    def login_athlete
      @athlete = Athlete.
        find_by(email: params[:email].downcase).
        try(:authenticate, params[:password])

      if @athlete
        session[:athlete_id] = @athlete.id
        redirect_to athlete_path(@athlete), flash:{success:"#{@athlete.name} you are logged in as an athlete"}
      else
        redirect_to root_path, flash:{alert:"please try to login again"}
      end
    end

    def destroy
      reset_session
      redirect_to root_path, flash:{success: "You are logged out."}
    end

end
