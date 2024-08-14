class ReportsController < ApplicationController
    before_action :authenticate_user! # Ensure user is logged in
  
    def show
      @user = current_user
  
      # Apply filters
      @entries = @user.entries
      @entries = @entries.where('entry_date >= ?', params[:start_date]) if params[:start_date].present?
      @entries = @entries.where('entry_date <= ?', params[:end_date]) if params[:end_date].present?
      @entries = @entries.where('mood >= ?', params[:min_mood]) if params[:min_mood].present?
      @entries = @entries.where('mood <= ?', params[:max_mood]) if params[:max_mood].present?
      @entries = @entries.where('sleep_hrs >= ?', params[:min_sleep]) if params[:min_sleep].present?
      @entries = @entries.where('sleep_hrs <= ?', params[:max_sleep]) if params[:max_sleep].present?
  
      # Summary calculations
      @mood_summary = calculate_mood_summary(@entries)
      @health_summary = calculate_health_summary(@entries)
  
      # Data for Chartkick
      @mood_data = @entries.order(:entry_date).pluck(:entry_date, :mood)
      @calorie_data = @entries.order(:entry_date).pluck(:entry_date, :calories_in)

    end
  
    private
  
    def calculate_mood_summary(entries)
      {
        average_mood: entries.average(:mood).to_f,
        mood_high: entries.maximum(:mood),
        mood_low: entries.minimum(:mood)
      }
    end
  
    def calculate_health_summary(entries)
      {
        average_sleep_hrs: entries.average(:sleep_hrs).to_f,
        total_steps: entries.sum(:steps),
        average_protein: entries.average(:protein).to_f,
        average_carbs: entries.average(:carbs).to_f,
        average_fats: entries.average(:fats).to_f
      }
    end
  end