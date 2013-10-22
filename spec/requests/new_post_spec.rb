#encoding: utf-8
require 'spec_helper'

describe "post pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "post creation" do
    before { visit new_post_path }

    describe "with invalid information" do

      it "should not create a post" do
        expect { click_button "Create Post" }.not_to change(post, :count)
      end

      describe "error messages" do
        before { click_button "Create Post" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before { fill_in 'content', with: "aaaaaaaam" }
      it "should create a post" do
        expect { click_button "post" }.to change(post, :count).by(1)
      end
    end
  end
end