require 'rails_helper'

describe "User visits login page" do
  it "they can log in" do
    user = User.create(name: "Sal", email: "sal@sal.com", password: "pass")

    visit login_path
    within("form") do
      fill_in "email", with: user.email
      fill_in "password", with: user.password
      click_on "Login"
    end

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Successfully logged in!")
    expect(page).to have_content("Welcome, Sal!")
    expect(page).to have_content("Logout")
  end
end
