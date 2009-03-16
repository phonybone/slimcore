require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do
  before(:each) do
    @valid_attributes = {
      :login => "value for login",
      :email => "value for email",
      :firstname => "value for firstname",
      :lastname => "value for lastname",
      :created_at => Time.now,
      :updated_at => Time.now,
      :lock_version => 1
    }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@valid_attributes)
  end
end
