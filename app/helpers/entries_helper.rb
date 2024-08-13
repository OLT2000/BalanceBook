require 'date'

module EntriesHelper
    def entry_form(entry)
        form_with(model: entry) do |form|
            concat content_tag(:h1, "Log Your Day", class: "text-lg font-semibold mb-2", style: "text-align: center")
            concat form.label(:title, "Enter your title...")
            concat form.text_field(:title, class: "form-control border-primary mb-1", required: true, placeholder: "Enter title...")

            concat content_tag(:h2, "How are you feeling?", class: "text-lg font-semibold mb-2", style: "text-align: center")

            concat form.label(:description, "Enter your description...")
            concat form.text_field(:description, class: "form-control border-primary mb-1", required: true, placeholder: "Enter description...")
        
            concat form.label(:mood, "Rate your mood between 0 and 10")
            concat form.select(:mood, 0..10, class: "form-control border-primary mb-1")
        
            concat content_tag(:h2, "Health Tracker", class: "text-lg font-semibold mb-2", style: "text-align: center")
        
            concat form.label(:sleep_hrs, "Enter your sleep in hours...")
            concat form.number_field(:sleep_hrs, max: 24, class: "form-control border-primary mb-1")
        
            concat form.label(:steps, "Enter your daily steps...")
            concat form.number_field(:steps, class: "form-control border-primary mb-1")
        
            concat form.label(:protein, "Enter your protein in grams...")
            concat form.number_field(:protein, class: "form-control border-primary mb-1")
        
            concat form.label(:carbs, "Enter your carbs in grams...")
            concat form.number_field(:carbs, class: "form-control border-primary mb-1")
        
            concat form.label(:fats, "Enter your fat in grams...")
            concat form.number_field(:fats, class: "form-control border-primary mb-1", placeholder: "Enter your fat in grams...")
        
            concat form.submit
        end
      end

      def format_date_with_suffix(date)
        # Format the date to get day, month, and year
        formatted_date = date.strftime('%a %d %b %Y')
      
        # Extract the day part and determine the suffix
        day = date.day
        suffix = case day
                 when 1, 21, 31 then 'st'
                 when 2, 22 then 'nd'
                 when 3, 23 then 'rd'
                 else 'th'
                 end
      
        # Replace the day number with the day number + suffix
        formatted_date.sub(/\d{2}/, "#{day}#{suffix}")
      end

      def generate_pie_chart_desc(nutrition_data)
        "This Pie Chart displays your macronutrient breakdown for the day. You consumed #{nutrition_data['Protein']}, #{nutrition_data['Carbs']} and #{nutrition_data['Fat']} calories worth of proteins, carbs and fats, respectively."

      end
  end
