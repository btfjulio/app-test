require 'rails_helper'

RSpec.feature "Show article" do

  scenario "Valid credentials" do
    visit "/"
    click_link "Sign Up"


    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "123456"
    fill_in "Password confirmation", with: "123456"


    click_button "Sign up"

    expect(page).to have_content("You have signed up successfully.")
    expect(page.current_path).to eq(root_path)
  end

  scenario "Invalid credentials" do
    visit "/"
    click_link "Sign Up"


    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: ""
    fill_in "Password confirmation", with: ""


    click_button "Sign up"

    # expect(page).to have_content("You have signed up successfully.")
    expect(page.current_path).to eq("/users")
  end

end