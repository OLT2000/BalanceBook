And('I input {string} for {string} in my {string} model') do |value, field, model|
    fill_in "#{model}_#{field}", with: value
end

And('I am given a user form explanation {string}') do |error_msg|
    expect(page).to have_css("div", id: "error_explanation", text: error_msg)
end

And('I clear the session') do
    reset_session!
end