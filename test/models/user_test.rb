require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:james)
  end

  test "should not have empty email" do
    @user.email = ""
    assert_not @user.valid?
  end
end
