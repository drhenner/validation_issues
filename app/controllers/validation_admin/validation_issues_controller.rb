class ValidationAdmin::ValidationIssuesController < ApplicationController
  before_filter :redirect_if_no_privileges
  # has_validation_issues_admin_privileges

  layout 'validation_admin_layout'

  # GET /validation_issues
  # GET /validation_issues.json
  def index
    @validation_issues = ValidationIssue.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @validation_issues }
    end
  end

  # GET /validation_issues/1
  # GET /validation_issues/1.json
  def show
    @validation_issue = ValidationIssue.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @validation_issue }
    end
  end

  # DELETE /validation_issues/1
  # DELETE /validation_issues/1.json
  def destroy
    @validation_issue = ValidationIssue.find(params[:id])
    @validation_issue.clear_data!

    respond_to do |format|
      format.html { redirect_to validation_admin_validation_issues_url }
      format.json { head :no_content }
    end
  end

  protected

  def redirect_if_no_privileges
    redirect_to root_url and return unless has_validation_issues_admin_privileges
  end
end
