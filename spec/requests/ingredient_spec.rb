require 'rails_helper'

RSpec.describe "Ingredients", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/ingredient/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/ingredient/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/ingredient/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/ingredient/create"
      expect(response).to have_http_status(:success)
    end
  end

end
