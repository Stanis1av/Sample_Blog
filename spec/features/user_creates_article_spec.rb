require 'spec_helper'
require 'rails_helper'
require 'session_helper'

feature "Article Creation" do
  before(:each) do
    sign_up
  end

  scenario "allows user to visit new article page" do
    visit new_article_path
    expect(page).to have_content 'New Articles' #I18n.t('devise.registrations.signed_up')
  end
end
