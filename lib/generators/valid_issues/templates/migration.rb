class CreateValidationIssues < ActiveRecord::Migration
  def self.up
    create_table :validation_issues do |t|

      t.string  :issue_type,  :null => false
      t.string  :form_name,   :null => false
      t.text    :issue_hash,  :null => false
      #t.text    :issued_by_ids
      t.text    :notes
      t.integer :issue_count
      t.integer :success_count

      t.timestamps
    end
    add_index :validation_issues, :form_name
    add_index :validation_issues, :issue_type

  end

  def self.down
    drop_table :versions
  end
end