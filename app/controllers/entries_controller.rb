class EntriesController < ApplicationController
    before_action :set_current_date

    def index
        if user_signed_in?
            puts "Index Date #{@current_date}"
            @entries = Entry.where(user_id: current_user.id, entry_date: @current_date)
            @nutrition_data = []
            @entries.each do |ent|
                puts ent.calories_in # = 56
                nutrition = {
                    'Protein' => (4.0 * ent.protein),
                    'Fat' => (9.0 * ent.fats),
                    'Carbs' => (4.0 * ent.carbs)
                }
                puts nutrition # = {"Protein"=>0, "Fat"=>0, "Carbs"=>0}

                @nutrition_data << nutrition
            end
        else
            redirect_to user_session_path, alert: "You must be signed in to do that!"
        end
    end

    def shift_date_left
        @current_date = @current_date - 1.day
        redirect_to root_path(date: @current_date)
    end

    def shift_date_right
        @current_date = @current_date + 1.day
        redirect_to root_path(date: @current_date)
    end
 
    def new
        if user_signed_in?
            @entry = Entry.new()
        else
            redirect_to root_path, alert: "You must be signed in to do that!"
        end
    end
 
    def create
        new_params = entry_params
        new_params["user_id"] = current_user.id
        new_params["entry_date"] = @current_date
        @entry = Entry.new(new_params)
        if @entry.save
            redirect_to root_url
        else
            render :new
        end
    end

    def destroy
        Entry.find(params[:id]).destroy
        redirect_to root_path
    end
 
    private

    def set_current_date
        @current_date = params[:date].present? ? Date.parse(params[:date]) : Date.today
    end
 
    def entry_params
        params.require(:entry).permit(:title, :description, :mood, :sleep_hrs, :steps, :protein, :carbs, :fats)
    end
end
