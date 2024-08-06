Given("I visit the page url {string}") do |url_string|
    visit url_string
    sleep 1
end

Then("I am redirected to the page url {string}") do |url_string|
    sleep 3
    expect(page).to have_url? url_string
end

When("I click the {string} button") do |button_text|
    click_button(button_text)
end

And("I am given a {string} alert: {string}") do |alert_type, alert_msg|
    expect(page).to have_css('div', class: "alert alert-#{alert_type}", text: alert_msg)
end