class User < ActiveRecord::Base
  has_one :authentication
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  def apply_omniauth(omniauth)
    # omniauth = { 'user_info' => { 'email' => 'matheustardivo@gmail.com' }, 'provider' => 'github', 'uid' => 'testando' }
    self.email = omniauth['user_info']['email'] if email.blank?
    self.authentication = Authentication.new(:provider => omniauth["provider"], :uid => omniauth["uid"])
  end
  
  def password_required?
    (!authentication || !password.blank?) && super
  end
end
