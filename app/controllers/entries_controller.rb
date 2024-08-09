class EntriesController < ApplicationController
    before_action :set_current_date
    before_action :initialize_session_hash


    def submit_api_call
        # user_input = params[:user_input]
        puts "SUBMITTING CALL: #{params}"
        selected_entry = Entry.find_by(id: params[:entry])

        protein_ratio = ((4.0 * selected_entry.protein) / selected_entry.calories_in).round(2) * 100
        carbs_ratio = ((4.0 * selected_entry.carbs) / selected_entry.calories_in).round(2) * 100
        fats_ratio = ((9.0 * selected_entry.fats) / selected_entry.calories_in).round(2) * 100

        llm_prompt = %(
            Given the following statistics, give an overview of my lifestyle choices in under 100 words.

            Today I consumed #{selected_entry.protein} grams of protein, #{selected_entry.carbs} grams of carbs, and #{selected_entry.fats} grams of fats. 
            This was a ratio of #{protein_ratio}:#{carbs_ratio}:#{fats_ratio} as a contribution to my total calorie intake of #{selected_entry.calories_in}.

            During the day I took #{selected_entry.steps} steps, which burned #{0.05 * selected_entry.steps} calories.
            Last night I slept #{selected_entry.sleep_hrs} hours.

            Overall, I would rate my mood for today as #{selected_entry.mood} out of 10.
        )

        @response = call_openai_api(llm_prompt)

        # Store the response in the session hash with the entry ID as the key
        session[:api_responses] = {"id" => params[:entry], "response" => @response}        
        
        redirect_to root_path
    end

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
        @current_date = params[:date]
    end

    def update
        puts "Params : #{params}"
        @entry = Entry.find(params[:id])
        @current_date = params[:date]
        if @entry.update(update_entry_params)
            redirect_to root_path(date: @current_date), notice: 'Journal entry was successfully updated.'
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
        @current_date = new_params['entry_date']
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

    def call_openai_api(prompt)
        response = HTTP.auth("Bearer #{ENV['OPENAI_API_KEY']}").post(
            "https://api.openai.com/v1/chat/completions",
            json: {
                model: 'gpt-4o',
                messages: [
                    
                    {
                        role: "system",
                        content: "You are a health, nutrition and lifestyle expert. Given some statistics about a persons lifestyle, you are to provide a brief summary of their choices, including what is good. Wherever possible, please suggest improvements that they could make."
                    },
                    {
                        role: "user",
                        content: prompt,
                    }
                ],
            }
        )
        
        content = response.parse["choices"][0]["message"]["content"]
        return content
    end

    def initialize_session_hash
        session[:api_responses] ||= {}
      end
end
