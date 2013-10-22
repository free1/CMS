#encoding: utf-8
require 'spec_helper'

describe "Session pages" do

    # 登录
	describe "signin" do
	  before { visit signin_path }

	  describe "with invalid information" do
	    before { click_button "登录" }

	    it { should have_link('登录', href: signin_path) }
	  end

	  describe "with valid information" do
	    let(:user) { FactoryGirl.create(:user) }
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