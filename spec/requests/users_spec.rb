require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    # Userを作成
    before { @users = FactoryGirl.create_list(:user, 2) }
    it "index" do
      get users_path

      # ステータスコードのチェック
      expect(response).to have_http_status(200)

      # JSONの内容のチェック
      json = JSON.parse(response.body)
      expect(json.size).to     eq @users.count
      expect(json[0]["id"]).to eq @users[0].id
      expect(json[1]["id"]).to eq @users[1].id
      get users_path
      expect(response).to have_http_status(200)
    end
  end
end
