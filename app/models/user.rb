class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :uid, :provider

  def self.find_for_google_oauth2(auth, signed_in_resource=nil)
    data = auth["info"]
    user = User.where(:provider => auth["provider"], :uid => auth["uid"]).first
    unless user
      user = User.create(first_name: data["first_name"],
                            last_name: data["last_name"],
                            provider: auth["provider"],
                            uid: auth["uid"],
                            email: data["email"],
                            password: Devise.friendly_token[0,20])
    end
    user
  end

  def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth["provider"], :uid => auth["uid"]).first
    data = auth["info"]
    unless user
      user = User.create(first_name: data["name"],
                            provider: auth["provider"],
                            uid: auth["uid"],
                            email: "#{data["nickname"]}@gmail.com",
                            password: Devise.friendly_token[0,20])
    end
    user

  end
end
