class RpgController < ApplicationController
  def index
    if session[:gold] ==nil
      session[:gold] = 0
    end

    if session[:message] ==nil
      session[:message] = []
    end

    session[:total_golds] = session[:gold].to_i + session[:total_golds].to_i
      @total_golds = session[:total_golds]

    if session[:gold] <0
      session[:message] <<"Entered Casino and lost #{session[:gold]*-1}"
    elsif session[:gold]>0
      session[:message] <<"Earned #{session[:gold]} golds from the #{session[:building]}" 
    end

    @activities =session[:message]
    session[:gold]=0
    session[:building]=""

  end



  def new
    if params[:building] =="casino"
      session[:gold] =rand(-50..50)
    elsif params[:builing] =="farm"
      session[:gold] =rand(10..20)
    elsif params[:builing] =="cave"
      session[:gold] =rand(5..10)
    else params[:builing] =="house"
      session[:gold] =rand(2..5)
    end

    session[:building] = params[:building]

    redirect_to :action => :index
  end

end
