And('I input {string} for {string} in my {string} model') do |value, field, model|
    fill_in "#{model}_#{field}", with: value
end