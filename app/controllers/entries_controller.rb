class EntriesController < ApplicationController
    def index
        @entries = Entry.all
    end
 
 
    def new
        @entry = Entry.new()
    end
 
    def create
        puts entry_params
        @entry = Entry.new(entry_params)
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
