class CreateValidationIssues < ActiveRecord::Migration
  def self.up
    create_table :validation_issues do |t|

      t.string  :issue_type,  :null => false
      t.string  :form_name,   :null => false
      t.text    :issue_hash,  :null => false
      #t.text    :issued_by_ids
      t.text    :notes
      t.integer :issue_count,   default: 0
      t.integer :success_count, default: 0

      t.timestamps
    end
    add_index :validation_issues, [:form_name, :issue_type], :unique => true
    add_index :validation_issues, :issue_type
  end

  def self.down
    drop_table :versions
  end
end