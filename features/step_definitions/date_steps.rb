require 'date'

Then('I am taken to the day before today') do
    expect(page).to have_content(
        Date.today()
    )
end