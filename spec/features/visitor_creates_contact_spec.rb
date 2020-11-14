require 'spec_helper'
require 'rails_helper'

feature "Contact creation" do
  scenario "allows acees to contacts page" do
    visit new_contacts_path

    expect(page).to have_content 'Contacts us'
  end
end
