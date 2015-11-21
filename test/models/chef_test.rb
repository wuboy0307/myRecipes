require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  def setup
    @chef=Chef.new(name: "Ramsay",email: "pro@cook.com")
  end
  
  test "name valid check" do
    assert @chef.valid?
  end
  
  test "name should be present" do
  @chef.name=" "
  assert_not @chef.valid?
  end
  
  test "length of name too long" do
    @chef.name = "a" * 51
    assert_not @chef.valid?
  end
  
  test "length of name too short" do
    @chef.name = "a" * 2
    assert_not @chef.valid?
  end
  
  test "emails should be valid" do
    valid_addr=%w[user@exam.com R_tdd-d@eee.org first.mail@123.au xi123@yhi.co.in laura+joe@monk.cm]
    valid_addr.each do |i|
      @chef.email=i
      assert @chef.valid?,'#{i.inspect} should be valid'
    end
  end
  
  test "emails can be rejected" do
    invalid_addr=%w[user@example,com user_at+.org user.name@exam. ee@I_am_.com foo@ear+.com]
    invalid_addr.each do |i|
      @chef.email=i
      assert_not @chef.valid?,'#{i.inspect should be invalid}'
    end
  end
  
  test "email should be unique" do
    dup_chef=@chef.dup
    dup_chef.email=@chef.email.upcase
    @chef.save
    assert_not dup_chef.valid?
  end
  
  test "email should be present" do 
    @chef.email=" "
    assert_not @chef.valid?
  end
  
  test "email within bounds" do 
    @chef.email = "a" * 51 + "@example.com"
    assert_not @chef.valid?
  end
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
  
end