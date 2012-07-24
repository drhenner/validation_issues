# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120722204204) do

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nick_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "validation_issues", :force => true do |t|
    t.string   "issue_type"
    t.string   "form_name",                     :null => false
    t.text     "issue_hash",                    :null => false
    t.text     "notes",         :default => ""
    t.integer  "issue_count",   :default => 0
    t.integer  "success_count", :default => 0
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "validation_issues", ["form_name", "issue_type"], :name => "index_validation_issues_on_form_name_and_issue_type", :unique => true
  add_index "validation_issues", ["form_name"], :name => "index_validation_issues_on_form_name"
  add_index "validation_issues", ["issue_type"], :name => "index_validation_issues_on_issue_type"

end
