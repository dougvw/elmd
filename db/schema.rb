# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100218030508) do

  create_table "issues", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "order_number"
    t.boolean  "active",       :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "privileges", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "privileges_roles", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "privilege_id"
  end

  add_index "privileges_roles", ["privilege_id"], :name => "index_privileges_roles_on_privilege_id"
  add_index "privileges_roles", ["role_id", "privilege_id"], :name => "index_privileges_roles_on_role_id_and_privilege_id"
  add_index "privileges_roles", ["role_id"], :name => "index_privileges_roles_on_role_id"

  create_table "recipients", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.string   "email"
    t.string   "token"
    t.boolean  "active",        :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_reminders", :force => true do |t|
    t.integer  "user_id"
    t.string   "token"
    t.datetime "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_reminders", ["user_id", "token", "expires_at"], :name => "index_user_reminders_on_user_id_and_token_and_expires_at"
  add_index "user_reminders", ["user_id"], :name => "index_user_reminders_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "password_hash"
    t.string   "salt"
    t.string   "email_address"
    t.integer  "role_id"
    t.boolean  "active"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email_address"], :name => "index_users_on_email_address"
  add_index "users", ["remember_me_token", "remember_me_token_expires_at"], :name => "index_users_on_remember_me_token"
  add_index "users", ["role_id"], :name => "index_users_on_role_id"

  create_table "volunteers", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.string   "email"
    t.string   "token"
    t.boolean  "active",           :default => true
    t.boolean  "phone_calls"
    t.boolean  "distribute_signs"
    t.boolean  "write_letters"
    t.boolean  "host_event"
    t.boolean  "large_sign"
    t.boolean  "yard_sign"
    t.boolean  "office_help"
    t.string   "other"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
