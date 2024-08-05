class EntriesController < ApplicationController
    def index
        @entries = Entry.all
    end
 
 
    def new
        if user_signed_in?
            @entry = Entry.new()
        else
            redirect_to root_path, alert: "You must be signed in to do that!"
        end
    end
 
    def create
        
        @entry = Entry.new(entry_params, user_id: current_user.id)
        if @entry.save
            redirect_to root_url
        else
            render :new
        end
    end

    def destroy
        Entry.find(params[:id]).destroy
        redirect_to root_url
    end
 
    private
 
    def entry_params
        params.require(:entry).permit(:title, :description, :mood, :sleep_hrs, :steps, :protein, :carbs, :fats)
    end
end
