require 'rails_helper'

describe "Logged in user clicks 'Logout'" do
  it "they are successfully logged out" do
    user = User.create(name: "Sal", email: "sal@sal.com", password: "pass")
    visit login_path
    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: user.password
    click_on "Login"

    click_on "Logout"

    expect(page).to have_content("Successfully logged out!")
    expect(page).to have_content("Login")
  end
end
