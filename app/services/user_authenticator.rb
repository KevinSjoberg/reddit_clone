class UserAuthenticator
  def self.authenticate(email, password)
    user = User.where(email: email).first || NullUser.new
    user.authenticate(password)
  end
end
