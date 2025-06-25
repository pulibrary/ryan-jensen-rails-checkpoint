require 'rails_helper'

RSpec.describe "Recipes", type: :request do
  describe "GET /list" do
    it "returns http success" do
      get "/recipes/list"
      expect(response).to have_http_status(:success)
    end
  end

end
