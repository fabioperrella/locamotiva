require 'spec_helper'

describe "races/new.html.erb" do
  before(:each) do
    assign(:race, stub_model(Race,
      :name => "MyString",
      :stage => "MyString",
      :place => "MyString",
      :distance => "MyString",
      :url => "MyString"
    ).as_new_record)
  end

  it "renders new race form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => races_path, :method => "post" do
      assert_select "input#race_name", :name => "race[name]"
      assert_select "input#race_stage", :name => "race[stage]"
      assert_select "input#race_place", :name => "race[place]"
      assert_select "input#race_distance", :name => "race[distance]"
      assert_select "input#race_url", :name => "race[url]"
    end
  end
end
