require 'spec_helper'

describe "List Links" do
  let(:user) { create(:user) }

  it "can be seen by everyone" do
    create(:link, user: user, title: "Link 1")
    create(:link, user: user, title: "Link 2")

    visit root_path

    expect(page).to have_content("Link 1")
    expect(page).to have_content("Link 2")
  end
end
