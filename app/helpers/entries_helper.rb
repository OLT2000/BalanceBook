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
end
