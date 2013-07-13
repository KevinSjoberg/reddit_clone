require 'spec_helper'

describe SessionsController do
  context "with valid credentials" do
    let(:user) { build(:user, email: 'user@example.com', password: 'password1') }

    it "logins successfully" do
      UserAuthenticator.stub(:authenticate).and_return(user)

      post :create, email: user.email, password: user.password

      expect(response).to redirect_to(root_path)
    end

    it "sets a session for user id" do
      user.id = 1
      UserAuthenticator.stub(:authenticate).and_return(user)

      post :create, email: user.email, password: user.password

      expect(session[:user_id]).to eq(user.id)
    end
  end

  context "with invalid credentials" do
    it "renders the new template" do
      UserAuthenticator.stub(:authenticate).and_return(false)

      post :create, email: 'user@example.com', password: 'wrong_password'

      expect(response).to render_template :new
    end
  end
end
