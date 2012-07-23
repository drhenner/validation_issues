require 'test_helper'

class ActsAsValidationIssuesTest < Test::Unit::TestCase

  def test_log_validation_issue_should_create_a_log
    vi_count_object = ValidationIssue.where(:form_name => 'user_form').last
    vi_count = vi_count_object.try(:issue_count) || 0
    user = User.new(:first_name => '', :last_name => 'Good Last Name')
    user.save
    user.log_validation_issue!('user_form')
    vi = ValidationIssue.where(:form_name => 'user_form').last
    assert_equal "User",              vi.issue_type
  #  assert_equal { "first_name" => 1 } , vi.issue_hash
    assert_equal (vi_count + 1),                   vi.issue_count
  end

  #def test_log_file_should_increment_a_log
  #  assert_equal "last_tweet", ValidationIssue.log_validation_issue!
  #end

end