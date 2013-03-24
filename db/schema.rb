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

ActiveRecord::Schema.define(:version => 20130324144356) do

  create_table "articles", :force => true do |t|
    t.string   "article_code"
    t.string   "article_text"
    t.string   "supplier"
    t.integer  "box"
    t.integer  "minimum_of_qty"
    t.string   "stock_risk"
    t.float    "unitary_price_if_box"
    t.float    "unitary_price_if_massive"
    t.float    "selling_price_inc_vat"
    t.float    "vat_rate"
    t.float    "estimated_price_decrease_ratio"
    t.date     "end_life_date"
    t.string   "end_life_option"
    t.string   "seasonality_code"
    t.integer  "stock_qty"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.string   "family"
    t.string   "department"
    t.string   "model_code"
    t.string   "model_name"
    t.string   "user"
  end

  create_table "movements", :force => true do |t|
    t.string   "article_code"
    t.date     "movement_date"
    t.float    "turnover"
    t.integer  "quantity"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "user"
    t.string   "movement_type"
  end

  create_table "orders", :force => true do |t|
    t.string   "article_code"
    t.string   "supplier"
    t.integer  "quantity"
    t.date     "creation_date"
    t.date     "expected_delivery_date"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "user"
    t.boolean  "validated"
    t.date     "validation_date"
  end

  create_table "planned_orders", :force => true do |t|
    t.string   "article_code"
    t.string   "supplier"
    t.integer  "quantity"
    t.date     "creation_date"
    t.date     "expected_delivery_date"
    t.boolean  "validated"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "user"
  end

  create_table "seasonalities", :force => true do |t|
    t.string   "seasonality"
    t.float    "w1"
    t.float    "w2"
    t.float    "w3"
    t.float    "w4"
    t.float    "w5"
    t.float    "w6"
    t.float    "w7"
    t.float    "w8"
    t.float    "w9"
    t.float    "w10"
    t.float    "w11"
    t.float    "w12"
    t.float    "w13"
    t.float    "w14"
    t.float    "w15"
    t.float    "w16"
    t.float    "w17"
    t.float    "w18"
    t.float    "w19"
    t.float    "w20"
    t.float    "w21"
    t.float    "w22"
    t.float    "w23"
    t.float    "w24"
    t.float    "w25"
    t.float    "w26"
    t.float    "w27"
    t.float    "w28"
    t.float    "w29"
    t.float    "w30"
    t.float    "w31"
    t.float    "w32"
    t.float    "w33"
    t.float    "w34"
    t.float    "w35"
    t.float    "w36"
    t.float    "w37"
    t.float    "w38"
    t.float    "w39"
    t.float    "w40"
    t.float    "w41"
    t.float    "w42"
    t.float    "w43"
    t.float    "w44"
    t.float    "w45"
    t.float    "w46"
    t.float    "w47"
    t.float    "w48"
    t.float    "w49"
    t.float    "w50"
    t.float    "w51"
    t.float    "w52"
    t.float    "w53"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "user"
  end

  create_table "suppliers", :force => true do |t|
    t.string   "supplier"
    t.string   "supplier_text"
    t.integer  "leadtime"
    t.float    "order_minimum_qty"
    t.float    "order_minimum_value"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "user"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "store"
    t.boolean  "admin",                  :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
