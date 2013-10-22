require 'spec_helper'

describe "StaticPages" do
  describe "about page" do
    it "should have the content 'about' " do
    	visit '/static_pages/about'
    	expect(page).to have_content('about')
    end
  end
end
