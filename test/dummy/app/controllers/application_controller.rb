class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
  def has_validation_issues_admin_privileges
    # logic you want to make this true
    # Typically this will work
    # current_user && current_user.admin?
    true
  end

end
