require 'rails_helper'

RSpec.describe "Admin::Menus", type: :request do
  describe "GET /admin_menus" do
    it "works! (now write some real specs)" do
      get admin_menus_path
      expect(response).to have_http_status(200)
    end
  end
end
