require 'spec_helper'

describe "missions/index" do
  before(:each) do
    assign(:missions, [
      stub_model(Mission,
        :name => "Name",
        :status => "Status",
        :user_id => 1,
        :server => "Server",
        :faction => "Faction"
      ),
      stub_model(Mission,
        :name => "Name",
        :status => "Status",
        :user_id => 1,
        :server => "Server",
        :faction => "Faction"
      )
    ])
  end

  it "renders a list of missions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Server".to_s, :count => 2
    assert_select "tr>td", :text => "Faction".to_s, :count => 2
  end
end
