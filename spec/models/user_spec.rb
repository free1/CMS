require 'spec_helper'

# 验证用户模型
describe User do

  before do
  	@user = User.new(name: "free", role: "admin", password: "111111111", password_confirmation: "111111111") 
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }

  it { should be_valid }

  describe "when name is not presence" do
  	before { @user.name = " " }
  	it { should_not be_valid }
  end

  describe "when name is too long" do
  	before { @user.name = "free" * 20 }
  	it { should_not be_valid }
  end

  describe "when name is already taken" do
  	before do
  		user_name = @user.dup
  		user_name.save
  	end

  	it { should_not be_valid }
  end

  describe "name with mixed case" do
  	let(:name_with_mixed_email) { "FREE" }

  	it "saved as all lower-case" do
  		@user.name = name_with_mixed_email
  		@user.save
  		expect(@user.reload.name).to eq name_with_mixed_email.downcase
  	end
  end

  describe "when role is not inclusion admin or member" do
  	before { @user.role = "free" }
  	it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "aaa" }
    it { should_not be_valid }
  end

  describe "user authenticate" do
  	before { @user.save }
  	let(:find_user) { User.find_by_name(@user.name) }

  	describe "when valid password" do
  		it { should eq find_user.authenticate(@user.password) }
  	end

  	describe "when invalid password" do
  		let(:invalid_password_with_user) { find_user.authenticate("invalid") }

  		it { should_not eq invalid_password_with_user }
  		specify { expect(invalid_password_with_user).to be_false }
  	end
  end
end

