module ValidationIssues
  module ActsAsValidationIssues
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def acts_as_validation_issues(options = {})
        # your code will go here
      end
    end

    # Instance Methods
    def log_validation_issue!(form_name, options = {})
      if self.errors
        vi = ValidationIssue.find_by_form_name_and_issue_type(form_name, self.class.to_s)
        vi ||= ValidationIssue.new(:form_name => form_name, :issue_type => self.class.to_s)

        self.errors.map {|k,v| k }.uniq.each do |error_field|
          vi.issue_hash ||= {}
          debugger
          vi.issue_hash[error_field] = 0 unless vi.issue_hash[error_field]
          vi.issue_hash[error_field] = vi.issue_hash[error_field] + 1
        end

        vi.notes ||= ''
        if options[:notes]
          vi.notes = vi.notes + ' \n ' + options[:notes]
        end
        vi.issue_count ||= 0
        vi.save
        vi.increment_issue_count!
      end
    end

    def log_successful_validation!(form_name, options = {})
      vi = ValidationIssue.find_by_form_name_and_issue_type(form_name, self.class.to_s)
      vi ||= ValidationIssue.new(:form_name => form_name, :issue_type => self.class.to_s)
      vi.notes ||= ''
      vi.issue_count ||= 0
      vi.issue_hash ||= {:no_issues => ''}
      vi.save
      vi.increment_success_count!
    end
  end
end

ActiveRecord::Base.send :include, ValidationIssues::ActsAsValidationIssues
