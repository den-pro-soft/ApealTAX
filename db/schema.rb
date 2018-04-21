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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180316195629) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "additional_data", id: :serial, force: :cascade do |t|
    t.string "hasAdditionalPins", limit: 255
    t.string "condominium", limit: 255
    t.string "condoAssociation", limit: 255
    t.string "associationName", limit: 255
    t.string "contact", limit: 255
    t.string "phone", limit: 255
    t.string "pin1", limit: 255
    t.string "pin2", limit: 255
    t.string "pin3", limit: 255
    t.integer "caseId"
    t.string "propertyId", limit: 255
    t.string "userId", limit: 255
  end

  create_table "analyst", id: :serial, force: :cascade do |t|
    t.string "first_name", limit: 255, null: false
    t.string "last_name", limit: 255, null: false
    t.string "email", limit: 255, null: false
    t.string "phone", limit: 255
    t.string "address", limit: 255
    t.string "realtor", limit: 255, null: false
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "modified_at"
  end

  create_table "bank_info", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "card_holder_name", limit: 255, null: false
    t.string "email", limit: 255, null: false
    t.string "phone", limit: 255
    t.string "billing_address", limit: 255
    t.string "credit_card_number", limit: 255, null: false
    t.string "cvc", limit: 255, null: false
    t.string "expiration_date", limit: 255, null: false
    t.boolean "auto_pay", default: false
    t.boolean "email_monthly_billing", default: false
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "modified_at"
  end

  create_table "case", id: :serial, force: :cascade do |t|
    t.string "property_id", limit: 255
    t.integer "analyst_id"
    t.integer "document_id"
    t.string "status", limit: 255
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "modified_at"
    t.string "firstName", limit: 255
    t.string "lastName", limit: 255
    t.string "address", limit: 255
    t.string "email", limit: 255
    t.string "city", limit: 255
    t.string "state", limit: 255
    t.string "zip", limit: 255
    t.string "phone", limit: 255
    t.integer "parent_id"
    t.string "flags", limit: 255, array: true
    t.string "qstatus", limit: 255
    t.string "company", limit: 255
    t.string "user_id", limit: 255
    t.boolean "payment", default: false
    t.boolean "agreement", default: false
    t.string "stripeEmail", limit: 255
    t.index ["property_id"], name: "case_property_id_idx"
  end

  create_table "comparables_data", id: :serial, force: :cascade do |t|
    t.string "subjectpropertypsfv", limit: 255
    t.string "subjectpropertysquarefeet", limit: 255
    t.string "subjectpropertylav", limit: 255
    t.string "subjectpropertybavavg", limit: 255
    t.string "comparablebavavg", limit: 255
    t.string "requestedbav", limit: 255
    t.string "requestedtav", limit: 255
    t.integer "caseId"
    t.string "propertyId", limit: 255
    t.integer "userId"
  end

  create_table "document", id: :serial, force: :cascade do |t|
    t.string "type", limit: 255, null: false
    t.string "name", limit: 255, null: false
    t.string "location", limit: 255, null: false
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "modified_at"
    t.integer "case_id"
    t.string "user_id", limit: 255
  end

  create_table "errored_properties", id: false, force: :cascade do |t|
    t.serial "id", null: false
    t.string "pin", limit: 80
    t.string "created_at", limit: 80
    t.string "modified_at", limit: 80
  end

  create_table "exemptions", id: false, force: :cascade do |t|
    t.serial "id", null: false
    t.string "propertyId", limit: 255
    t.string "primaryResidence", limit: 80
    t.string "exemptionOnAnotherProperty", limit: 80
    t.string "over65", limit: 80
    t.string "created_at", limit: 80
    t.string "modified_at", limit: 80
    t.string "yearBorn", limit: 255
    t.integer "caseId"
    t.string "userId", limit: 255
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "property", id: :string, limit: 255, force: :cascade do |t|
    t.string "rec_type", limit: 255, null: false
    t.bigint "pin", null: false
    t.string "township", limit: 255, null: false
    t.integer "ovacls", null: false
    t.text "class_description", null: false
    t.integer "current_land", null: false
    t.integer "current_building", null: false
    t.integer "current_total", null: false
    t.integer "prior_land", null: false
    t.integer "prior_building", null: false
    t.integer "prior_total", null: false
    t.integer "pprior_land", null: false
    t.integer "pprior_building", null: false
    t.integer "pprior_total", null: false
    t.integer "pprior_year", null: false
    t.integer "town", null: false
    t.integer "volume", null: false
    t.string "loc", limit: 255, null: false
    t.integer "tax_code", null: false
    t.integer "neighborhood", null: false
    t.integer "landmark"
    t.integer "multi_indicator"
    t.integer "prorate_indicator"
    t.integer "board_indicator"
    t.integer "partial_indicator"
    t.integer "home_impr_year"
    t.integer "pass_indicator"
    t.integer "pass_year", null: false
    t.integer "div_year"
    t.string "div_trans", limit: 255
    t.boolean "div_indicator"
    t.integer "div_no"
    t.integer "open_space_ind"
    t.integer "unique_indicator"
    t.string "houseno", limit: 255
    t.string "dir", limit: 255
    t.string "street", limit: 255
    t.string "suffix", limit: 255
    t.string "apt", limit: 255
    t.string "city", limit: 255
    t.string "res_type", limit: 255
    t.string "bldg_use", limit: 255
    t.string "apt_desc", limit: 255
    t.string "comm_units", limit: 255
    t.string "ext_desc", limit: 255
    t.integer "full_bath"
    t.integer "half_bath"
    t.string "bsmt_desc", limit: 255
    t.string "attic_desc", limit: 255
    t.integer "ac"
    t.integer "fireplace"
    t.string "gar_desc", limit: 255
    t.integer "age"
    t.decimal "building_sq_ft", precision: 10
    t.decimal "land_sq_ft", precision: 10
    t.string "bldg_sf", limit: 255
    t.string "units_tot", limit: 255
    t.integer "multi_sale"
    t.integer "deed_type"
    t.string "sale_date", limit: 255
    t.string "sale_amount", limit: 255
    t.integer "appcnt"
    t.integer "appeal_a"
    t.string "appeal_a_status", limit: 255
    t.string "appeal_a_result", limit: 255
    t.integer "appeal_a_reason"
    t.string "appeal_a_pin_result", limit: 255
    t.integer "appeal_a_propav"
    t.integer "appeal_a_currav"
    t.string "appeal_a_resltdate", limit: 255
    t.integer "appeal_b"
    t.string "appeal_b_status", limit: 255
    t.string "appeal_b_result", limit: 255
    t.integer "appeal_b_reason"
    t.string "appeal_b_pin_result", limit: 255
    t.integer "appeal_b_propav"
    t.integer "appeal_b_currav"
    t.string "appeal_b_resltdate", limit: 255
    t.integer "appeal_c"
    t.string "appeal_c_status", limit: 255
    t.string "appeal_c_result", limit: 255
    t.integer "appeal_c_reason"
    t.string "appeal_c_pin_result", limit: 255
    t.integer "appeal_c_propav"
    t.integer "appeal_c_currav"
    t.string "appeal_c_resltdate", limit: 255
    t.integer "appeal_d"
    t.string "appeal_d_status", limit: 255
    t.string "appeal_d_result", limit: 255
    t.integer "appeal_d_reason"
    t.string "appeal_d_pin_result", limit: 255
    t.integer "appeal_d_propav"
    t.integer "appeal_d_currav"
    t.string "appeal_d_resltdate", limit: 255
    t.integer "hostat"
    t.integer "hsstat"
    t.string "recdate", limit: 255
    t.integer "yr01"
    t.integer "yr01stat"
    t.integer "yr01stat2"
    t.integer "yr01hoeav"
    t.integer "yr01hseav"
    t.integer "yr01frz"
    t.integer "yr02"
    t.integer "yr02stat"
    t.integer "yr02stat2"
    t.integer "yr02hoeav"
    t.integer "yr02hseav"
    t.integer "yr02frz"
    t.integer "yr03"
    t.integer "yr03stat"
    t.integer "yr03stat2"
    t.integer "yr03hoeav"
    t.integer "yr03hseav"
    t.integer "yr03frz"
    t.integer "yr04"
    t.integer "yr04stat"
    t.integer "yr04stat2"
    t.integer "yr04hoeav"
    t.integer "yr04hseav"
    t.integer "yr04frz"
    t.integer "yr01yr"
    t.integer "yr01cofe"
    t.integer "yr01type"
    t.integer "yr01reason"
    t.integer "yr01cestat"
    t.integer "yr02yr"
    t.integer "yr02cofe"
    t.integer "yr02type"
    t.integer "yr02reason"
    t.integer "yr02cestat"
    t.integer "yr03yr"
    t.integer "yr03cofe"
    t.integer "yr03type"
    t.integer "yr03reason"
    t.integer "yr03cestat"
    t.integer "yr04coeyr"
    t.integer "yr04cofe"
    t.integer "yr04type"
    t.integer "yr04reason"
    t.integer "yr04cestat"
    t.string "bldpsfv", limit: 255
    t.string "landpsv", limit: 255
    t.string "property_image", limit: 255
    t.string "s3_property_image", limit: 255
    t.integer "data_date"
    t.string "property_pass", limit: 25
    t.datetime "created_date"
    t.text "fulladdress"
    t.index ["city", "street"], name: "property_city_street_idx"
    t.index ["city"], name: "property_v2_city_idx"
    t.index ["houseno", "street", "city"], name: "property_v2_houseno_street_city_idx"
    t.index ["houseno"], name: "property_v2_houseno_idx"
    t.index ["id"], name: "property_v2_id_idx"
    t.index ["pin"], name: "property_v2_pin_idx"
    t.index ["street", "city"], name: "property_street_city_idx"
    t.index ["street"], name: "property_v2_street_idx"
    t.index ["township"], name: "property_v2_township_idx"
  end

  create_table "property_detail", id: :serial, force: :cascade do |t|
    t.string "property_id", limit: 255
    t.integer "document_id"
    t.boolean "five_years_purchase", default: false
    t.decimal "purchase_price", precision: 8, scale: 2
    t.datetime "purchase_date"
    t.string "distressed_sale", limit: 255
    t.string "most_recent_refinance", limit: 255
    t.string "refinance_appraised_value", limit: 255
    t.string "interest_rate", limit: 255
    t.string "vacancy_three_months", limit: 255
    t.string "property_thorn_down", limit: 255
    t.string "interest_term", limit: 255
    t.string "selling_house_date", limit: 255
    t.boolean "refinanced_five_years", default: false
    t.string "user_id", limit: 255
  end

  create_table "property_selected", id: :serial, force: :cascade do |t|
    t.string "rec_type", limit: 255, null: false
    t.bigint "pin", null: false
    t.string "township", limit: 255, null: false
    t.integer "ovacls", null: false
    t.text "class_description", null: false
    t.integer "current_land", null: false
    t.integer "current_building", null: false
    t.integer "current_total", null: false
    t.integer "prior_land", null: false
    t.integer "prior_building", null: false
    t.integer "prior_total", null: false
    t.integer "pprior_land", null: false
    t.integer "pprior_building", null: false
    t.integer "pprior_total", null: false
    t.integer "pprior_year", null: false
    t.integer "town", null: false
    t.integer "volume", null: false
    t.string "loc", limit: 255, null: false
    t.integer "tax_code", null: false
    t.integer "neighborhood", null: false
    t.integer "landmark"
    t.integer "multi_indicator"
    t.integer "prorate_indicator"
    t.integer "board_indicator"
    t.integer "partial_indicator"
    t.integer "home_impr_year"
    t.integer "pass_indicator"
    t.integer "pass_year", null: false
    t.integer "div_year"
    t.string "div_trans", limit: 255
    t.boolean "div_indicator", default: false
    t.integer "div_no"
    t.integer "open_space_ind"
    t.integer "unique_indicator"
    t.string "houseno", limit: 255
    t.string "dir", limit: 255
    t.string "street", limit: 255
    t.string "suffix", limit: 255
    t.string "apt", limit: 255
    t.string "city", limit: 255
    t.string "res_type", limit: 255
    t.string "bldg_use", limit: 255
    t.string "apt_desc", limit: 255
    t.string "comm_units", limit: 255
    t.string "ext_desc", limit: 255
    t.integer "full_bath"
    t.integer "half_bath"
    t.string "bsmt_desc", limit: 255
    t.string "attic_desc", limit: 255
    t.integer "ac"
    t.integer "fireplace"
    t.string "gar_desc", limit: 255
    t.integer "age"
    t.decimal "building_sq_ft", precision: 10
    t.decimal "land_sq_ft", precision: 10
    t.string "bldg_sf", limit: 255
    t.string "units_tot", limit: 255
    t.integer "multi_sale"
    t.integer "deed_type"
    t.string "sale_date", limit: 255
    t.string "sale_amount", limit: 255
    t.integer "appcnt"
    t.integer "appeal_a"
    t.string "appeal_a_status", limit: 255
    t.string "appeal_a_result", limit: 255
    t.integer "appeal_a_reason"
    t.string "appeal_a_pin_result", limit: 255
    t.integer "appeal_a_propav"
    t.integer "appeal_a_currav"
    t.string "appeal_a_resltdate", limit: 255
    t.integer "appeal_b"
    t.string "appeal_b_status", limit: 255
    t.string "appeal_b_result", limit: 255
    t.integer "appeal_b_reason"
    t.string "appeal_b_pin_result", limit: 255
    t.integer "appeal_b_propav"
    t.integer "appeal_b_currav"
    t.string "appeal_b_resltdate", limit: 255
    t.integer "appeal_c"
    t.string "appeal_c_status", limit: 255
    t.string "appeal_c_result", limit: 255
    t.integer "appeal_c_reason"
    t.string "appeal_c_pin_result", limit: 255
    t.integer "appeal_c_propav"
    t.integer "appeal_c_currav"
    t.string "appeal_c_resltdate", limit: 255
    t.integer "appeal_d"
    t.string "appeal_d_status", limit: 255
    t.string "appeal_d_result", limit: 255
    t.integer "appeal_d_reason"
    t.string "appeal_d_pin_result", limit: 255
    t.integer "appeal_d_propav"
    t.integer "appeal_d_currav"
    t.string "appeal_d_resltdate", limit: 255
    t.integer "hostat"
    t.integer "hsstat"
    t.string "recdate", limit: 255
    t.integer "yr01"
    t.integer "yr01stat"
    t.integer "yr01stat2"
    t.integer "yr01hoeav"
    t.integer "yr01hseav"
    t.integer "yr01frz"
    t.integer "yr02"
    t.integer "yr02stat"
    t.integer "yr02stat2"
    t.integer "yr02hoeav"
    t.integer "yr02hseav"
    t.integer "yr02frz"
    t.integer "yr03"
    t.integer "yr03stat"
    t.integer "yr03stat2"
    t.integer "yr03hoeav"
    t.integer "yr03hseav"
    t.integer "yr03frz"
    t.integer "yr04"
    t.integer "yr04stat"
    t.integer "yr04stat2"
    t.integer "yr04hoeav"
    t.integer "yr04hseav"
    t.integer "yr04frz"
    t.integer "yr01yr"
    t.integer "yr01cofe"
    t.integer "yr01type"
    t.integer "yr01reason"
    t.integer "yr01cestat"
    t.integer "yr02yr"
    t.integer "yr02cofe"
    t.integer "yr02type"
    t.integer "yr02reason"
    t.integer "yr02cestat"
    t.integer "yr03yr"
    t.integer "yr03cofe"
    t.integer "yr03type"
    t.integer "yr03reason"
    t.integer "yr03cestat"
    t.integer "yr04coeyr"
    t.integer "yr04cofe"
    t.integer "yr04type"
    t.integer "yr04reason"
    t.integer "yr04cestat"
    t.decimal "bldpsfv", precision: 8, scale: 2
    t.decimal "landpsv", precision: 8, scale: 2
    t.string "property_image", limit: 255
    t.integer "case_id"
    t.datetime "created_date", default: -> { "now()" }
    t.integer "data_date"
    t.string "property_pass", limit: 25
    t.string "s3_property_image", limit: 255
  end

  create_table "realtor", id: :integer, default: -> { "nextval('realtor_seq'::regclass)" }, force: :cascade do |t|
    t.string "companyName", limit: 255
    t.string "companyId", limit: 255
    t.string "created_at", limit: 255, default: "now()"
    t.string "modified_at", limit: 255
    t.string "realtorId", limit: 255
    t.string "picture", limit: 255
    t.string "userId", limit: 255
  end

  create_table "sales_info", id: :serial, force: :cascade do |t|
    t.string "propertyId", limit: 255
    t.string "purchasedFiveYears", limit: 255
    t.string "purchasePrice", limit: 255
    t.string "purchaseDate", limit: 255
    t.string "distressedSale", limit: 255
    t.string "mostRecentRefinance", limit: 255
    t.string "appraisedValueRefinance", limit: 80
    t.string "interestRate", limit: 120
    t.string "vacancy3months", limit: 255
    t.string "tornDown", limit: 255
    t.text "documents"
    t.string "created_at", limit: 80
    t.string "modified_at", limit: 80
    t.integer "caseId"
    t.string "interestTerm", limit: 120
    t.string "sellingHouseDate", limit: 120
    t.string "refinancedFiveYears", limit: 120
    t.string "rebuiltDate", limit: 255
    t.string "propertyRebuilt", limit: 255
    t.string "userId", limit: 255
  end

  create_table "tempaddress", id: false, force: :cascade do |t|
    t.string "tempid", limit: 255
    t.text "tempaddress"
  end

  create_table "user", primary_key: "userId", id: :string, limit: 255, force: :cascade do |t|
    t.string "email", limit: 255
    t.string "accessToken", limit: 255
    t.integer "expiresIn"
    t.text "idToken"
    t.jsonb "payload"
    t.string "scope", limit: 255
    t.string "state", limit: 255
    t.string "tokenType", limit: 255
    t.string "firstName", limit: 255
    t.string "lastName", limit: 255
    t.string "nickname", limit: 255
    t.string "address", limit: 255
    t.string "phone", limit: 255
    t.string "role", limit: 255
    t.string "realtorId", limit: 255
    t.serial "id", null: false
    t.datetime "createdAt", default: -> { "now()" }
    t.datetime "modified_at"
    t.string "companyName", limit: 255
    t.boolean "stripe", default: false
    t.boolean "docusign", default: false
  end

  create_table "user_old", id: :integer, default: -> { "nextval('user_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "first_name", limit: 255, null: false
    t.string "last_name", limit: 255, null: false
    t.string "email", limit: 255, null: false
    t.string "phone", limit: 255
    t.string "address", limit: 255
    t.string "password", limit: 255, null: false
    t.string "token", limit: 255, null: false
    t.text "role", null: false
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "modified_at"
    t.string "realtorId", limit: 255
    t.string "activationCode", limit: 255
    t.integer "activated"
    t.string "companyName", limit: 255
    t.index ["email"], name: "user_email_unique", unique: true
  end

  create_table "user_property", id: false, force: :cascade do |t|
    t.serial "id", null: false
    t.integer "caseId"
    t.string "propertyId", limit: 255
    t.bigint "pin"
    t.string "neighborhood", limit: 255
    t.string "address", limit: 255
    t.string "city", limit: 255
    t.string "geoLat", limit: 255
    t.string "geoLng", limit: 255
    t.string "appartments", limit: 80
    t.string "exteriorConstruct", limit: 120
    t.integer "fullBaths"
    t.integer "halfBaths"
    t.string "basementCondition", limit: 80
    t.string "atticCondition", limit: 120
    t.integer "ac"
    t.integer "fireplaces"
    t.string "garageType", limit: 120
    t.decimal "buildingSF", precision: 10
    t.decimal "landSF", precision: 10
    t.integer "age"
    t.string "created_at", limit: 80
    t.string "modified_at", limit: 80
    t.string "township", limit: 80
    t.string "property_image", limit: 80
    t.string "realtorId", limit: 255
    t.string "first_name", limit: 255
    t.string "last_name", limit: 255
    t.string "company", limit: 255
    t.string "userId", limit: 255
    t.string "s3_property_image", limit: 255
    t.integer "data_date"
    t.string "property_pass", limit: 25
    t.datetime "created_date"
    t.index ["caseId"], name: "user_property_caseId_idx"
    t.index ["id"], name: "user_property_id_key", unique: true
    t.index ["userId"], name: "user_property_userId_idx"
  end

  add_foreign_key "additional_data", "\"case\"", column: "caseId", name: "additional_data_caseId_fkey", on_delete: :cascade
  add_foreign_key "additional_data", "\"user\"", column: "userId", primary_key: "userId", name: "additional_data_userId_fkey", on_delete: :cascade
  add_foreign_key "bank_info", "user_old", column: "user_id", name: "bank_info_user_id_foreign"
  add_foreign_key "case", "\"user\"", column: "user_id", primary_key: "userId", name: "case_userId_fkey", on_delete: :cascade
  add_foreign_key "case", "analyst", name: "case_analyst_id_foreign"
  add_foreign_key "case", "document", name: "case_document_id_foreign"
  add_foreign_key "comparables_data", "\"case\"", column: "caseId", name: "comparables_data_caseId_fkey", on_delete: :cascade
  add_foreign_key "comparables_data", "user_old", column: "userId", name: "comparables_data_userId_fkey", on_delete: :cascade
  add_foreign_key "document", "\"user\"", column: "user_id", primary_key: "userId", name: "document_userId_fkey", on_delete: :cascade
  add_foreign_key "exemptions", "\"case\"", column: "caseId", name: "exemptions_caseId_fkey", on_delete: :cascade
  add_foreign_key "exemptions", "\"user\"", column: "userId", primary_key: "userId", name: "exemptions_userId_fkey", on_delete: :cascade
  add_foreign_key "property_detail", "\"user\"", column: "user_id", primary_key: "userId", name: "property_detail_userId_fkey", on_delete: :cascade
  add_foreign_key "property_detail", "document", name: "property_detail_document_id_foreign"
  add_foreign_key "property_detail", "property", name: "property_detail_property_id_fkey", on_delete: :cascade
  add_foreign_key "property_selected", "\"case\"", column: "case_id", name: "caseId", on_delete: :cascade
  add_foreign_key "realtor", "\"user\"", column: "userId", primary_key: "userId", name: "realtor_userId_fkey"
  add_foreign_key "sales_info", "\"user\"", column: "userId", primary_key: "userId", name: "sales_info_userId_fkey", on_delete: :cascade
  add_foreign_key "user_property", "\"case\"", column: "caseId", name: "user_property_caseId_fkey", on_delete: :cascade
  add_foreign_key "user_property", "\"user\"", column: "userId", primary_key: "userId", name: "user_property_userId_fkey", on_delete: :cascade
  add_foreign_key "user_property", "property", column: "propertyId", name: "user_property_propertyId_fkey", on_delete: :cascade
end
