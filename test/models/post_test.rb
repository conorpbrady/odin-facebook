require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:james)
    @post = @user.posts.build(content: "First!")
  end

  test "should be valid" do
    assert @post.valid?
  end

  test "should not be empty content" do
    @post.content = ""
    assert_not @post.valid?
  end

  test "should not exceed 140 characters" do
    @post.content = "a" * 141
    assert_not @post.valid?
  end

end
