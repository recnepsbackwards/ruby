class GameController < ApplicationController

  def try

  end

  def run
    # If there is no cookie with a secret number,
    # create a cookie with a secret number
    if session[:secretnumber].nil? || session[:secretnumber] == ""
        session[:secretnumber] = rand(100)
      #if it is nil, set the value of the secretnumber parameter to a random number between 0-2
    end

    # guess = params[:secretnumber].to_i

    if params[:guess].to_i == session[:secretnumber].to_i
      @returnwin = "You Win"
      session[:secretnumber] = ""
    elsif params[:guess].to_i < session[:secretnumber].to_i
      @returnloss = params[:guess].to_s + " is toooo low."
    else params[:guess].to_i > session[:secretnumber].to_i
      @returnloss = params[:guess].to_s + " is toooo high."
    end
  end
end
