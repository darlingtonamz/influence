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

ActiveRecord::Schema.define(:version => 20160222163104) do

  create_table "ambassadors", :force => true do |t|
    t.integer  "user_id"
    t.integer  "campaign_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "brands", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "campaigns", :force => true do |t|
    t.integer  "brand_id"
    t.string   "name"
    t.string   "url"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "campaigns_countries", :id => false, :force => true do |t|
    t.integer "campaign_id"
    t.integer "country_id"
  end

  create_table "campaigns_interests", :id => false, :force => true do |t|
    t.integer  "campaign_id"
    t.integer  "interest_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "countries", :force => true do |t|
    t.string   "iso"
    t.string   "name"
    t.string   "nicename"
    t.string   "iso3"
    t.string   "numcode"
    t.string   "phonecode"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "impressions", :force => true do |t|
    t.integer  "ambassador_id"
    t.string   "source"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.string   "session_id"
    t.integer  "clicks",        :default => 0
    t.integer  "hover_time"
    t.string   "country"
  end

  create_table "interests", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "interests_users", :id => false, :force => true do |t|
    t.integer  "user_id"
    t.integer  "interest_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "leads", :force => true do |t|
    t.integer  "ambassador_id"
    t.string   "source"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "socials", :force => true do |t|
    t.string   "provider"
    t.integer  "uid"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "subscriptions", :force => true do |t|
    t.string   "email"
    t.boolean  "is_brand"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "role"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
