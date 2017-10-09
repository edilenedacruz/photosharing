require 'rails_helper'

RSpec.feature "Registered User" do
  it "Registered user can login" do
    user = create(:user)

    visit root_path
    click_link "Login"

    fill_in "Username", with: "#{user.username}"
    fill_in "Password", with: "#{user.password}"

    within(".login") do
      click_on "Login"
    end

    expect(page).to have_content("Hello, #{user.first_name}")
  end

  it "Logged in user can logout" do
    user = create(:user)

    visit root_path
    click_link "Login"

    fill_in "Username", with: "#{user.username}"
    fill_in "Password", with: "#{user.password}"

    within(".login") do
      click_on "Login"
    end

    expect(page).to have_content("Hello, #{user.first_name}")

    within (".login-bar") do
      click_link "Logout"
    end

    expect(current_path).to eq(root_path)
  end
end
