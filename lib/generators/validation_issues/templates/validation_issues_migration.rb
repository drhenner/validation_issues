class CreateValidationIssues < ActiveRecord::Migration
  def change
    create_table :validation_issues do |t|
      t.string :issue_type
      t.string :form_name,  :null => false
      t.text :issue_hash,   :null => false
      t.text :notes,        :default => ''
      t.integer :issue_count
      t.integer :success_count

      t.timestamps
    end
    add_index :validation_issues, [:form_name, :issue_type], :unique => true
    add_index :validation_issues, :issue_type
  end
end
