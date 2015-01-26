require 'spec_helper'

RSpec.describe MainController, :type => :controller do

  describe "GET get_correct_answer" do
    it "returns http success" do
      get :get_correct_answer
      expect(response).to be_success
    end
  end

end