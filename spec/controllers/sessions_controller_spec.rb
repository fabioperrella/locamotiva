require 'spec_helper'

describe SessionsController do
  describe "POST create" do
    before :each do
      setup_controller_for_warden
      request.env["devise.mapping"] = Devise.mappings[:user]
      
    end

    context "when admin user" do
      it "redirects to /admin after login" do
        admin = FactoryGirl.create :user, :role => "admin"
        post :create, :user => {:email => admin.email, :password => admin.password}
        response.should redirect_to rails_admin_path
      end
    end
    context "when not admin user" do
      it "redirects to / after login" do
        user = FactoryGirl.create :user, :role => "user"
        post :create, :user => {:email => user.email, :password => user.password}
        response.should redirect_to root_path
      end
    end
  end
end