require 'rails_helper'

describe CalculatorController do

  context '#update' do
    it 'should do addition' do
      put :update, :command => "add 5"
      expect(response.status).to eq(200)
      expect(response.body).to eq("5.0")
    end

    it "should reset the value to 0" do
      put :update, :command =>"reset"
      expect(response.status).to eq(200)
      expect(response.body).to eq("0.0")
    end

  end
  context "integration - multiple commands" do
    it "should add 5 and multipy 3" do
      put :update, :command =>"add 5"
      put :update, :command =>"mul 3"
      expect(response.status).to eq(200)
      expect(response.body).to eq("15.0")
    end
  end






end