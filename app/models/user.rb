# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  adress                 :text
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  firstname              :string
#  lastname               :string
#  phone_number           :string
#  deleted_at             :datetime
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ActiveRecord::Base

  default_scope { where(:deleted_at => nil) }

  has_many :quotes

  rolify
  include RailsAdmin::UserAdmin

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  def display_fullname
    return "#{lastname} #{firstname.first}" if firstname && lastname
    email
  end
  
  def to_label
    "#{id} | #{email}"
  end

end
