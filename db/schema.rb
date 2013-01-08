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

ActiveRecord::Schema.define(:version => 20130108212642) do

  create_table "articles", :force => true do |t|
    t.string   "articleCode"
    t.string   "articleText"
    t.string   "supplier"
    t.integer  "box"
    t.integer  "minimumOfQty"
    t.string   "stockRisk"
    t.float    "unitaryPriceIfBox"
    t.float    "unitaryPriceIfMassive"
    t.float    "sellingPriceIncVAT"
    t.float    "vATRate"
    t.float    "estimatedPriceDecreaseRatio"
    t.date     "endLifeDate"
    t.string   "endLifeOption"
    t.string   "seasonalityCode"
    t.integer  "stockQty"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "movements", :force => true do |t|
    t.string   "articleCode"
    t.date     "movementDate"
    t.float    "turnover"
    t.integer  "quantity"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "orders", :force => true do |t|
    t.string   "articleCode"
    t.string   "supplier"
    t.integer  "quantity"
    t.date     "creationDate"
    t.date     "expectedDeliveryDate"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "planned_orders", :force => true do |t|
    t.string   "articleCode"
    t.string   "supplier"
    t.integer  "quantity"
    t.date     "creationDate"
    t.date     "expectedDeliveryDate"
    t.boolean  "validated"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "suppliers", :force => true do |t|
    t.string   "supplier"
    t.string   "supplierText"
    t.integer  "leadtime"
    t.float    "orderMinimumQty"
    t.float    "orderMinimumValue"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

end
