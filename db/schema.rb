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

ActiveRecord::Schema.define(:version => 20120306015742) do

  create_table "admin_notes", :force => true do |t|
    t.integer  "resource_id",     :null => false
    t.string   "resource_type",   :null => false
    t.integer  "admin_user_id"
    t.string   "admin_user_type"
    t.text     "body"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "admin_notes", ["admin_user_type", "admin_user_id"], :name => "index_admin_notes_on_admin_user_type_and_admin_user_id"
  add_index "admin_notes", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "races", :force => true do |t|
    t.string   "name"
    t.datetime "date"
    t.string   "place"
    t.string   "distance"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "vacancies"
    t.string   "state"
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "subscriptions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "race_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.string   "shirt_size", :limit => 15
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                :default => "", :null => false
    t.string   "encrypted_password",                   :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.string   "role",                                                 :null => false
    t.string   "name",                                                 :null => false
    t.string   "cpf",                                                  :null => false
    t.string   "gender",                 :limit => 1
    t.string   "shirt_size",             :limit => 15,                 :null => false
    t.date     "birth_date"
    t.string   "department"
  end

  add_index "users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "votes", :force => true do |t|
    t.integer  "race_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
