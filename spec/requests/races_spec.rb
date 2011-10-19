require 'spec_helper'

describe "Races" do
  describe "GET /races" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get races_path
      response.status.should be(200)
    end
  end
  describe "date format long" do
    #se esse formato estiver errado, pode quebrar o datePicker na edicao/criacao de corridas
    it "should have the format %e %B %Y" do
      I18n.l(Date.parse("2011/01/10"), :format => :long).should == "10 Janeiro 2011"
    end
  end
end
