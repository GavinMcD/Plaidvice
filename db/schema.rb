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

ActiveRecord::Schema.define(:version => 20111028200947) do

  create_table "nuggets", :force => true do |t|
    t.string   "audience"
    t.string   "topic"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "nuggets", ["audience"], :name => "index_nuggets_on_audience"
  add_index "nuggets", ["topic"], :name => "index_nuggets_on_topic"
  add_index "nuggets", ["user_id"], :name => "index_nuggets_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.text     "description"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nickname"
  end

end
