require 'rails_helper'

RSpec.feature "User Session" do

  before do 
    @john = User.create(
      email: "john@example.com",
      password: "password"
    )

    visit "/"

    click_link "Sign In"

    fill_in "Email", with: @john.email
    fill_in "Password", with: @john.password
    click_button "Log in"
  end

  scenario "signing user out" do
    visit "/"

    click_link "Sign Out"

    expect(page).to  have_content("Signed out successfully")
    expect(page).to  have_content("Sign In")
    expect(page).not_to  have_content("Sign Out")
  end

end