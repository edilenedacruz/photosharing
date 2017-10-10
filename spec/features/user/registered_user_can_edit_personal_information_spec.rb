require 'rails_helper'

RSpec.feature "Registered User" do
  xit "can update personal information" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    within(".login-bar") do
      click_link "You"
    end

  end
end
