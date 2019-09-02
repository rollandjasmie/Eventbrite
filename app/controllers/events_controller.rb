class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new,]
  def index
  	@event = Event.all
  end
  def show
  	@event = Event.find(params[:id])
  end
  def new
  	@event = Event.new
  end
  def create
  	@event = Event.new(title:params[:title],description:params[:description],start_date:params[:start_date],duration:params[:duration].to_i,location:params[:location],price:params[:price],administre_id:current_user.id)
  		if @event.save
  			redirect_to event_path(@event.id)
  		else
  		render 'new'

  		end

  end
  def edit 
  end
  
  def update
    @event = Event.find(params[:id])
    @event.update(title:params[:title],description:params[:description],start_date:params[:start_date],duration:params[:duration],location:params[:location],price:params[:price])
    redirect_to "/events/#{params[:id]}"  
  
  end




end
