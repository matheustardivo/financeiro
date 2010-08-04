class User < ActiveRecord::Base
  acts_as_authentic
  
  validates_presence_of :password
  validates_presence_of :email
  
  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self)
  end
end
