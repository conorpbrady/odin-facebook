require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:james)
    @other_user = users(:jake)
    @post = @user.posts.build(content: "Hello")
    @comment = @post.comments.build(content: 'Some Comment')
    @comment.author_id = @user.id
  end

  test "should be valid" do
    assert @comment.valid?
  end

  test "should not be empty" do
    @comment.content = ""
    assert_not @comment.valid?
  end

  test "should not exceed 140 character" do
    @comment.content = "a" * 141
    assert_not @comment.valid?
  end

end
