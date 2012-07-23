FactoryGirl.define do
  factory :validation_issue do
    issue_type "User"
    form_name "user_form"
    issue_hash { ":first_name=>8, :nick_name=>8" }
    notes ""
    issue_count 7
  end
end