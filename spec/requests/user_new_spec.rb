#encoding: utf-8
require 'spec_helper'

describe "User pages" do

  subject { page }

  # 注册
  describe "signup" do

    before { visit signup_path }

    let(:submit) { "注册" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "name",         with: "free1"
        fill_in "role",         with: "admin"
        fill_in "password",     with: "111111111"
        fill_in "password_confirmation", with: "111111111"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end

end