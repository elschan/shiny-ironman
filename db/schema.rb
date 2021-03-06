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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150813184053) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coffeemeets", force: true do |t|
    t.string   "location"
    t.boolean  "accepted"
    t.boolean  "confirmed",             default: false
    t.text     "invite_blurb"
    t.text     "invite_accept"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "inviter_id"
    t.integer  "invitee_id"
    t.string   "invite_blurb_contact"
    t.string   "invite_accept_contact"
    t.boolean  "inviter_hide",          default: false
    t.boolean  "invitee_hide",          default: false
  end

  create_table "comments", force: true do |t|
    t.integer  "parent_comment_id"
    t.integer  "post_id"
    t.integer  "member_id"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", force: true do |t|
    t.string   "username"
    t.integer  "invite_count"
    t.integer  "reputation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
    t.boolean  "admin",                  default: false
    t.boolean  "banned",                 default: false
    t.boolean  "open_to_irl",            default: false
    t.string   "social_handles"
    t.string   "location"
    t.integer  "coffeepoints",           default: 0
    t.string   "blurb"
    t.string   "fave_coffee"
    t.string   "fullname"
    t.string   "slug"
  end

  add_index "members", ["email"], name: "index_members_on_email", unique: true, using: :btree
  add_index "members", ["invitation_token"], name: "index_members_on_invitation_token", unique: true, using: :btree
  add_index "members", ["invitations_count"], name: "index_members_on_invitations_count", using: :btree
  add_index "members", ["invited_by_id"], name: "index_members_on_invited_by_id", using: :btree
  add_index "members", ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true, using: :btree
  add_index "members", ["slug"], name: "index_members_on_slug", unique: true, using: :btree

  create_table "notifications", force: true do |t|
    t.integer  "member_id"
    t.integer  "actor_id"
    t.string   "action"
    t.integer  "comment_id"
    t.integer  "post_id"
    t.boolean  "seen",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "coffee_id"
  end

  create_table "posts", force: true do |t|
    t.integer  "member_id"
    t.string   "title"
    t.string   "url"
    t.text     "text"
    t.string   "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category"
    t.integer  "comment_count", default: 0
  end

  create_table "posts_tags", id: false, force: true do |t|
    t.integer "post_id"
    t.integer "tag_id"
  end

  create_table "signups", force: true do |t|
    t.string   "email"
    t.text     "application"
    t.boolean  "accepted",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "votes", force: true do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree

end
