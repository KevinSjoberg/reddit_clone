require 'spec_helper'

describe "User logins", :type => :feature do
  context "with valid credentials" do
    before do
      @user = create(:user, 
                       email: 'user@example.com', 
                       password: 'password1',
                       password_confirmation: 'password1')
    end

    it "logins successfully" do
      visit login_path

      within("#login-form") do
        fill_in 'Email',    :with => @user.email
        fill_in 'Password', :with => @user.password
      end

      click_on "Login"

      expect(page).to have_content("Login successfully")
    end
  end
end
