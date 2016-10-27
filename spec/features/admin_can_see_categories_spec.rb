require 'rails_helper'

describe 'User visits the admin categories page' do
  context 'as an admin' do
    it 'they see Admin Categories' do
      admin = User.create(name: "sal",
                          email: "sal@sal.com",
                          password: "pass",
                          password_confirmation: "pass",
                          role: 1
                         )
      ApplicationController.any_instance.stubs(:current_user).returns(admin)

      visit admin_categories_path
      expect(page).to have_content("Admin Categories")
    end
  end

  context 'as a default user' do
    it 'they are shown a 404' do
      user = User.create(name: "Sal",
                         email: "sal@sal.com",
                         password: "pass",
                         password_confirmation: "pass"
                        )

      ApplicationController.any_instance.stubs(:current_user).returns(user)
      visit admin_categories_path
      expect(page).to_not have_content("Admin Categories")
      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
