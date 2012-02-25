require 'spec_helper'

describe 'devise/registrations/new' do
  before :each do
    @view.stub(:resource).and_return(User.new) 
    @view.stub(:resource_name).and_return('user') 
  end

  ['email','cpf','name','shirt_size','department','birth_date','password','password_confirmation'].each do |field|
    it 'renders form including field #{field}' do
      render
      rendered.should =~ /#{field}/
    end
  end
end