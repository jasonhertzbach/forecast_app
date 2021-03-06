require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @user = User.create!(username: "test name", email: "email@test.com", password_digest: "123123" )
  end

  describe "validation" do
    it "should not let a user be created without username" do
      @user.username = nil
      expect(@user).to_not be_valid
    end
  end

  it "should not let a user be created without an email" do
    @user.email = nil
    expect(@user).to_not be_valid
  end

  it "should not let a user be created without a password" do
    @user.password_digest = nil
    expect(@user).to_not be_valid
  end

end
