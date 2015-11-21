require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.create(name:"bobby",email:"bob@example.com")
    @recipe = @chef.recipes.build(name:"vegsoup",summary:"bangola bow bow",decsription:"search google")
  end
  
  test "recipe should be valid" do
   assert @recipe.valid?
  end
  
  test "chef_id must be valid" do
    @recipe.chef_id=nil
    assert_not @recipe.valid?
  end
  
  test "name should be present" do
    @recipe.name = " "
    assert_not @recipe.valid?
  end
  
  test "length of name should not be too long" do
    @recipe.name="a"*51
    assert_not @recipe.valid?
  end
  test "length of name should not be too short" do
    @recipe.name="aa"
    assert_not @recipe.valid?
  end
  test "summary should be present" do
    @recipe.summary=" "
    assert_not @recipe.valid?
  end
  test "summary length not too long" do
    @recipe.summary="a"*151
    assert_not @recipe.valid?
  end
  test "summary length not too short" do
    @recipe.summary="a"*4
    assert_not @recipe.valid?
  end
  test "decsription should be present" do
    @recipe.decsription=" "
    assert_not @recipe.valid?
  end
  test "decsription length not too long" do
    @recipe.decsription="a"*501
    assert_not @recipe.valid?
  end
  test "decsription length not too short" do
    @recipe.decsription="a"*4
    assert_not @recipe.valid?
  end
end