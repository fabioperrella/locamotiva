require 'spec_helper'

describe "races/index.html.erb" do
  before(:each) do
    assign(:races, [
      stub_model(Race,
        :name => "Name",
        :stage => "Stage",
        :place => "Place",
        :distance => "Distance",
        :url => "Url"
      ),
      stub_model(Race,
        :name => "Name",
        :stage => "Stage",
        :place => "Place",
        :distance => "Distance",
        :url => "Url"
      )
    ])
  end

  it "renders a list of races" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Stage".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Place".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Distance".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
  end
end
