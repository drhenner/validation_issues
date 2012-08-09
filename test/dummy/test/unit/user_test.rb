require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'log_successful_validation! should work with no data' do
    user = FactoryGirl.build(:user, :first_name => 'Fred',
                                    :last_name => 'flint'#,
                                    #:nick_name => 'Fl'
                                    )
    user.save
    puts user.errors.full_messages
    user.log_successful_validation!('test')
    vi = ValidationIssue.find_by_form_name_and_issue_type('test', 'User')
    assert_equal 1, vi.success_count
  end
end
