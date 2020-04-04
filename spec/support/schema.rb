require "active_record/relation"
require "active_record/schema"

ActiveRecord::Schema.define do
  create_table "cats", force: :cascade do |t|
    t.string "name", null: false
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
