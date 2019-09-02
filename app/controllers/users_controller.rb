class UsersController < ApplicationController
  def index
  end

  def new
  end
  def show
    @user = User.find(params[:id])
    @event = Event.all
  end
  def edit
    
  end
  def update
    @user = User.update(first_name:params[:first_name],last_name:params[:last_name],description:params[:description])
    redirect_to "/users/#{params[:id]}"
  end

  def create
  end

  def destroy
  end
end
