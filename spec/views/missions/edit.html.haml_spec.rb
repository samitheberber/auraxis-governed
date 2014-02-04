require 'spec_helper'

describe "missions/edit" do
  before(:each) do
    @mission = assign(:mission, stub_model(Mission,
      :name => "MyString",
      :status => "MyString",
      :user_id => 1,
      :server => "MyString",
      :faction => "MyString"
    ))
  end

  it "renders the edit mission form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", mission_path(@mission), "post" do
      assert_select "input#mission_name[name=?]", "mission[name]"
      assert_select "input#mission_status[name=?]", "mission[status]"
      assert_select "input#mission_user_id[name=?]", "mission[user_id]"
      assert_select "input#mission_server[name=?]", "mission[server]"
      assert_select "input#mission_faction[name=?]", "mission[faction]"
    end
  end
end
