class User < ActiveRecord::Base
  attr_accessible :username, :session_token, :password, :password_confirmation
  has_secure_password

  validates :username, :uniqueness => true, :presence => true
  validates :password, :length => { :in =>  8..16,
              :message => "must be 8-16 characters"},
            :format => { :with => /[A-Za-z]\w+\d+/,
              :message => "must start with a letter and also contain numbers"},
            :presence => true

end
