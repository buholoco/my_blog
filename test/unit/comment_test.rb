require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @attr = { content: 'Some comment', email: 'user@example.com' }
    @comment = blogs(:one).comments.build(@attr)
  end

  test "should respond to content" do
    assert @comment.respond_to?(:content)
  end

  test "should respond to email" do
    assert @comment.respond_to?(:email)
  end

  test "should respond to blog_id" do
    assert @comment.respond_to?(:blog_id)
  end

  test "should raise Exception when trying to assign blog_id" do
    assert_raises(ActiveModel::MassAssignmentSecurity::Error) do
      Comment.new(blog_id: blogs(:one).id)
    end
  end

  test "should have content" do
    @comment.content = ' '
    assert !@comment.save
  end

  test "should have email" do
    @comment.email = ' ' 
    assert !@comment.save
  end

  test "should save valid comment" do
    @comment.content = @attr[:content]
    @comment.email = @attr[:email]

    assert @comment.save
  end

  test "should reject invalid email address" do
    @comment.content = @attr[:content]
    @invalid_email = %w[user@foo,com user_at_foo.org example.user@foo.
                        foo@bar_baz.com foo@bar+baz.com]
    @invalid_email.each do |email|
      @comment.email = email
      assert !@comment.save
    end
  end

  test "should accept valid email address" do
    @comment.content = @attr[:content]
    @valid_email = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
    @valid_email.each do |email|
      @comment.email = email
      assert @comment.save
    end
  end

  test "should save lowercase email address" do
    @comment.content = @attr[:content]
    mixed_case_email = 'SOMEeMAIL@ADdress.com'
    @comment.email = mixed_case_email
    @comment.save
    @comment.reload
    assert @comment.email == mixed_case_email.downcase
  end
end
