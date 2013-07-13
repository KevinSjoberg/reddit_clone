require 'spec_helper'

describe UserAuthenticator do
  describe "#authenticate" do
    let!(:user) { create(:user) }

    context "with valid credentials" do
      it "returns the user" do
        result = UserAuthenticator.authenticate(user.email, user.password)
        expect(result).to eq(user)
      end
    end

    context "with invalid credentials" do
      it "returns false by invalid email" do
        result = UserAuthenticator.authenticate("wrong_user@example.com", user.password)
        expect(result).to eq(false)
      end

      it "returns false by wrong password" do
        result = UserAuthenticator.authenticate(user.email, "wrong_password")
        expect(result).to eq(false)
      end
    end
  end
end
