require 'test_helper'

class ValidationIssueTest < ActiveSupport::TestCase
  test ".clear_data!" do
    # assert true
    validation_issue = FactoryGirl.build(:validation_issue, :form_name => 'my_super_form',
                                                            :issue_count => 5,
                                                            :issue_hash => {'name' => 2,
                                                                            'password' => 3})
    vi = ValidationIssue.find_by_form_name_and_issue_type(validation_issue.form_name, 'User')
    if vi
      validation_issue = vi
    else
      validation_issue.save
    end
    validation_issue.clear_data!
    assert_equal validation_issue.issue_count, 0
    assert_equal validation_issue.success_count, 0
    # puts @validation_issue.issue_hash.size
    validation_issue.issue_hash.each do |key, num|
      assert_equal 0, num
    end
  end

  test '.total_count' do
    validation_issue = FactoryGirl.create(:validation_issue, :form_name => 'my_super_form',
                                                            :issue_count => 5,
                                                            :success_count => 13,
                                                            :issue_hash => {'name' => 2,
                                                                            'password' => 3})

    assert_equal validation_issue.total_count, 18
  end
end
