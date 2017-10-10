require 'rails_helper'

RSpec.feature "Registered User" do
  it "can update personal information" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    click_link "You"
    click_link "Profile"

    expect(current_path).to eq(user_path(user))

    click_link "Edit your personal information"

    expect(current_path).to eq(edit_user_path(user))
  end
end
