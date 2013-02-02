class Sharing < ActiveRecord::Base
  attr_accessible :sharer, :friend, :sharer_id, :friend_id

  belongs_to :sharer, :class_name => "User", :foreign_key => :sharer_id
  belongs_to :friend, :class_name => "User", :foreign_key => :friend_id

  validates :sharer_id, :presence => true
  validates :friend_id, :presence => true
  validates :sharer_id, :uniqueness => { :scope => :friend_id }
  validates :sharer_id, :exclusion =>
      { :in => [:friend_id], :message => "Silly rabbit, secrets are for OTHERS!" }

end
