require 'rails_helper'

describe CalculatorController do
  let(:user){User.create(:email => "test@test.com", :encrypted_password => "abcdefghijkl")}
  before(:each) do
    sign_in :user, user
    request.env['warden'].stub :authenticate! => user
    allow(controller).to receive(:current_user) { user }
  end
  context '#update' do

    it 'should do addition' do

      put :update, :command => "add 5"
      expect(response.status).to eq(200)
      expect(assigns[:state]).to eq(5.0)
    end

    it "should reset the value to 0" do
      put :update, :command =>"reset"
      expect(response.status).to eq(200)

    end

  end
  context "integration - multiple commands" do
    it "should add 5 and multipy 3" do
      put :update, :command => "add 5"
      put :update, :command => "mul 3"
      expect(response.status).to eq(200)
      expect(assigns[:state]).to eq(15.0)
    end
  end

end
