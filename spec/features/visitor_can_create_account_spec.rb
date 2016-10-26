require 'rails_helper'

describe "User visits a new user page" do
  it "they can create a new user" do
    visit new_user_path
    fill_in "user[name]", with: "Sal"
    fill_in "user[email]", with: "sal@sal.com"
    fill_in "user[password]", with: "pass"
    click_on "Create User"

    expect(current_path).to eq(user_path(User.last))
    expect(page).to have_content("Successfully logged in!")
    expect(page).to have_content("Welcome, Sal!")
    expect(page).to have_content("Logout")
  end
end
