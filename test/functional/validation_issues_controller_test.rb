require 'test_helper'

class ValidationAdmin::ValidationIssuesControllerTest < ActionController::TestCase

  setup do
    validation_issue = FactoryGirl.build(:validation_issue) #validation_issues(:one)
    vi = ValidationIssue.find_by_form_name_and_issue_type(validation_issue.form_name, 'User')
    if vi
      @validation_issue = vi
    else
      validation_issue.save
      @validation_issue = validation_issue
    end
    @controller.stubs(:has_validation_issues_admin_privileges).returns(true)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:validation_issues)
  end

  test "should show validation_issue" do
    get :show, id: @validation_issue
    assert_response :success
  end

  test "should destroy validation_issue" do
    @validation_issue.issue_hash = {:first_name => 3}
    @validation_issue.save
    #assert_difference('ValidationIssue.count', -1) do
      delete :destroy, id: @validation_issue
    #end
    @validation_issue.reload
    assert_equal @validation_issue.issue_count, 0
    # puts @validation_issue.issue_hash.size
    @validation_issue.issue_hash.each do |key, num|
      assert_equal 0, num
    end
    assert_redirected_to validation_admin_validation_issues_path
  end
end
