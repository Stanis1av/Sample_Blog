require 'spec_helper'
require 'rails_helper'

feature "Contact creation" do
  scenario "allows accees to contacts page" do
    visit new_contacts_path

    expect(page).to have_content I18n.t('contacts.contact_us')
  end

  scenario "allows a guest to create contact" do
    visit new_contacts_path

    fill_in :contact_email, :with =>'user@exaple.com'
    fill_in :contact_message, :with =>'something'
    click_button 'Send message'

    expect(page).to have_content 'Thanks!'
  end
end
