require 'spec_helper'

describe Movie do
  it "has a title" do
    movie = Fabricate.build(:movie).should be_valid
  end
end
