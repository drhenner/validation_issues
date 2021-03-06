class ValidationIssue < ActiveRecord::Base
  serialize :issue_hash, Hash

  validates :form_name,  presence: true, uniqueness: true

  def clear_data!
    self.issue_count    = 0
    self.success_count  = 0
    self.issue_hash     = {}
    self.notes          = ''
    self.save!
  end

  def increment_issue_count!
    increment_with_sql!('issue_count')
  end

  def increment_success_count!
    increment_with_sql!('success_count')
  end

  def total_count
    (success_count || 0) + (issue_count || 0)
  end

  protected

    def increment_with_sql!(attribute, by = 1)
      raise ArgumentError("Invalid attribute: #{attribute}") unless attribute_names.include?(attribute.to_s)
      #original_value_sql = "CASE WHEN `#{attribute}` IS NULL THEN 0 ELSE `#{attribute}` END"
      self.class.where("id = #{id}").update_all("#{attribute} = #{attribute} + #{by.to_i}")

      reload
    end
end
