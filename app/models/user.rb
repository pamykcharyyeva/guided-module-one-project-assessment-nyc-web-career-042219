# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  name         :string
#  phone_number :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class User < ActiveRecord::Base
    has_many :appointments
    has_many :stylists, through: :appointments

end
