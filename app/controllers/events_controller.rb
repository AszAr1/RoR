class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy delete_confirmation ]
  before_action :set_categories, only: %i[ new edit ]
  before_action :redirect_unless_signed_in

  def index
    @events = Event.where(user_id: current_user.id)
  end
  
  def show
    puts "Event: "
    puts @event.date
    puts Date.today > @event.date
    @is_changeable = Date.today <= @event.date
    @change_button_class = @is_changeable ? "button" : "disabled" 
  end

  def edit
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to event_url(@event), notice: "Post was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def delete_confirmation
  end

  def destroy
    @event.destroy!

    respond_to do |format|
      format.html { redirect_to events_path, alert: "Event was successfully destroyed." }
    end
  end


  def new
    @event = Event.new
  end

  def create 
    final_params = event_params.merge(user_id: current_user.id)
    @event = Event.new(final_params)
    if @event.save 
      redirect_to root_path
    else 
      redirect_to new_event_path
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :date, :category_id)
  end

  def set_event
    puts "Params:"
    puts params
    @event = Event.find(params[:id])
  end

  def set_categories
    @categories = User.find(current_user.id).categories
  end

  def redirect_unless_signed_in
    unless user_signed_in?
      redirect_to root_path 
    end
  end

end
