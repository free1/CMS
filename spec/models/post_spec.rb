require 'spec_helper'

# 验证post模型
describe Post do

  let(:user) { FactoryGirl.create(:user) }
  before { @post = user.posts.build(title: "test", content: "testtest") }

  describe "when user_id is not present" do
    before { @post.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank title" do
    before { @post.title = " " }
    it { should_not be_valid }
  end

  describe "with title that is too long" do
    before { @post.title = "a" * 101 }
    it { should_not be_valid }
  end

  describe "with blank content" do
    before { @post.content = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @post.content = "a" * 1001 }
    it { should_not be_valid }
  end
end