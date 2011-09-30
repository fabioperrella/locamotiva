require 'spec_helper'

describe "races/show.html.erb" do
  before(:each) do
    @race = assign(:race, stub_model(Race,
      :name => "Name",
      :stage => "Stage",
      :place => "Place",
      :distance => "Distance",
      :url => "Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Stage/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Place/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Distance/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Url/)
  end
end
