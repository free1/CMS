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

  # 登录
	describe "signin" do
	  before { visit signin_path }

	  describe "with invalid information" do
	    before { click_button "登录" }

	    it { should have_link('登录', href: signin_path) }
	  end

	  describe "with valid information" do
	    let(:user) { User.new(name: "free11", role: "admin", password: "111111111", password_confirmation: "111111111")  }
	    before do
	      fill_in "name",    with: user.name.upcase
	      fill_in "password", with: user.password
	      click_button "登录"
	    end

	    it { should have_link('退出',    href: signout_path) }
	    it { should_not have_link('登录', href: signin_path) }
	  end
	end
end