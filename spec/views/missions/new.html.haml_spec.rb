require 'spec_helper'

describe "missions/new" do
  before(:each) do
    assign(:mission, stub_model(Mission,
      :name => "MyString",
      :status => "MyString",
      :user_id => 1,
      :server => "MyString",
      :faction => "MyString"
    ).as_new_record)
  end

  it "renders new mission form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", missions_path, "post" do
      assert_select "input#mission_name[name=?]", "mission[name]"
      assert_select "input#mission_status[name=?]", "mission[status]"
      assert_select "input#mission_user_id[name=?]", "mission[user_id]"
      assert_select "input#mission_server[name=?]", "mission[server]"
      assert_select "input#mission_faction[name=?]", "mission[faction]"
    end
  end
end
