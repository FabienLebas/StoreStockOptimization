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

ActiveRecord::Schema.define(:version => 20130227214414) do

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
  end

  create_table "movements", :force => true do |t|
    t.string   "article_code"
    t.date     "movement_date"
    t.float    "turnover"
    t.integer  "quantity"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "orders", :force => true do |t|
    t.string   "article_code"
    t.string   "supplier"
    t.integer  "quantity"
    t.date     "creation_date"
    t.date     "expected_delivery_date"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
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
  end

  create_table "suppliers", :force => true do |t|
    t.string   "supplier"
    t.string   "supplier_text"
    t.integer  "leadtime"
    t.float    "order_minimum_qty"
    t.float    "order_minimum_value"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

end
