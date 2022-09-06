class CreateEc2Instances < ActiveRecord::Migration[7.0]
  def change
    create_table "ec2_instances", force: :cascade do |t|
       t.string   "name",                 limit: 255
       t.string   "instance_id",          limit: 255
       t.datetime "created_at",                         null: false
       t.datetime "updated_at",                         null: false
       t.integer  "team_id",              limit: 4
       t.integer  "user_id",              limit: 4
       t.string   "ami",                  limit: 255
       t.string   "flavor",               limit: 255
       t.boolean  "bootstrapped"
       t.boolean  "joined"
       t.string   "subnet_id",            limit: 255
       t.string   "security_group_ids",   limit: 255
       t.string   "domain",               limit: 255
       t.text     "run_list",             limit: 65535
       t.string   "platform",             limit: 255
       t.integer  "volume_size",          limit: 4
       t.boolean  "terminated"
       t.string   "ip_address",           limit: 255
       t.boolean  "dns"
       t.string   "state",                limit: 255
       t.boolean  "protected"
     end
  end
end
