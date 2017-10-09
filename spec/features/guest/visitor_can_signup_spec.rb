require 'rails_helper'

RSpec.feature "Visitor" do
  context "when visiting home page" do
    it "should see a login and signup option" do

      visit root_path

      expect(page).to have_link("Login")
      expect(page).to have_link("Sign Up")
    end
  end

  it "can create an account" do

    visit root_path

    click_link "Sign Up"

    expect(current_path).to eq(new_user_path)
  end

  it "can enter personal information" do

    visit new_user_path

    fill_in "First name", with: "Jane"
    fill_in "Last name", with: "Doe"
    fill_in "Username", with: "rockstar"
    fill_in "Email", with: "rockstar@email.com"
    fill_in "Phone", with: "5558675309"
    fill_in "Profile photo url", with: "http://i.huffpost.com/gen/3299308/images/o-STRONG-WOMAN-facebook.jpg"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    click_link "Sign Up"

    # expect(current_path).to eq(root_path)
    expect(page).to have_content("Logout")
  end
end
