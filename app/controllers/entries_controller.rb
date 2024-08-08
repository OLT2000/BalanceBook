class EntriesController < ApplicationController
    before_action :set_current_date

    def index
        if user_signed_in?
            @entry = Entry.find_by(user_id: current_user.id, entry_date: @current_date)

            if @entry.nil?
                @nutrition_data = {}
            else
                @nutrition_data = {
                        'Protein' => (4.0 * @entry.protein),
                        'Fat' => (9.0 * @entry.fats),
                        'Carbs' => (4.0 * @entry.carbs)
                }
            end
        
        else
            redirect_to user_session_path, alert: "You must be signed in to do that!"
        end
    end

    def edit
        @entry = Entry.find(params[:id])
    end

    def update
        @entry = Entry.find(params[:id])
        puts @entry
        if @entry.update(update_entry_params)
            puts @current_date
            redirect_to root_path, notice: 'Journal entry was successfully updated.'
        else
            render :edit
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
            redirect_to sign_in_path, alert: "You must be signed in to do that!"
        end
    end
 
    def create
        new_params = entry_params
        new_params["user_id"] = current_user.id
        # new_params["entry_date"] = @current_date
        @entry = Entry.new(new_params)
        if @entry.save
            redirect_to root_url(date: @current_date)
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
        params.require(:entry).permit(:entry_date, :description, :mood, :sleep_hrs, :steps, :protein, :carbs, :fats)
    end

    def update_entry_params
        params.require(:entry).permit(:description, :mood, :sleep_hrs, :steps, :protein, :carbs, :fats)
    end
end
