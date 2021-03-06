require 'rails_helper'

RSpec.describe City, type: :model do

  before(:each) do
    @city = City.create!(name: "miami", user_id: 1 )
  end

  describe "validation" do
    it "should not let a miami be created without name" do
      @city.name = nil
      expect(@city).to_not be_valid
    end
  end

  it "should not let a city be created without an user_id" do
    @city.user_id = nil
    expect(@city).to_not be_valid
  end
end
