class User < ActiveRecord::Base
  has_many :lab_memberships, :dependent => :destroy
  has_many :lab_groups, :through => :lab_memberships

  validates_presence_of     :login, :email, :firstname, :lastname
  validates_length_of       :login,    :within => 3..40
  validates_length_of       :email,    :within => 3..100
  validates_uniqueness_of   :login, :email, :case_sensitive => false
  validate :unique_combination_of_firstname_and_lastname
  
  def unique_combination_of_firstname_and_lastname
    same_name_users = User.find(:all,
                      :conditions => ["firstname = ? AND lastname = ?",
                      firstname, lastname])
    # don't count the current user
    if( same_name_users.include?(self) )
      same_name_users.delete(self)
    end
    if( same_name_users.size > 0 )
      errors.add("This name is already in use")
    end
  end
end
