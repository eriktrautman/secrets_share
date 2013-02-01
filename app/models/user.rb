class User < ActiveRecord::Base
  attr_accessible :username, :session_token, :password, :password_confirmation
  has_secure_password

  has_many :secrets

  validates :username, :uniqueness => true, :presence => true
  validates :password, :length => { :in =>  8..16,
              :message => "must be 8-16 characters"},
            :format => { :with => /[A-Za-z]\w+\d+/,
              :message => "must start with a letter and also contain numbers"},
            :presence => true





  def reset_token
    token = SecureRandom.hex
    if self.update_attribute(:session_token, token)
      token
    else
      flash[:error] = @user.errors.full_messages.to_sentence
      false
    end
  end

  def delete_token
    self.update_attribute(:session_token, nil)
  end

end
