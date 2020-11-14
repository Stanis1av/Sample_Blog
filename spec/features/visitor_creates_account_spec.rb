require 'spec_helper'
require 'rails_helper'
require 'session_helper'

feature "Account Creation" do
  before(:each) do
    sign_up
  end

  scenario "allows guest to create account" do

    expect(page).to have_content I18n.t('devise.registrations.signed_up')
  end
end
