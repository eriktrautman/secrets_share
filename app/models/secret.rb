class Secret < ActiveRecord::Base
  attr_accessible :user, :text, :user_id

  belongs_to :user

end
