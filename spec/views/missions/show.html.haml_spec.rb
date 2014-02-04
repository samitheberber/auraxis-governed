require 'spec_helper'

describe "missions/show" do
  before(:each) do
    @mission = assign(:mission, stub_model(Mission,
      :name => "Name",
      :status => "Status",
      :user_id => 1,
      :server => "Server",
      :faction => "Faction"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Status/)
    rendered.should match(/1/)
    rendered.should match(/Server/)
    rendered.should match(/Faction/)
  end
end
