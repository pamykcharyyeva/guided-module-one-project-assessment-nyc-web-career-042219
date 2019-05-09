# == Schema Information
#
# Table name: stylists
#
#  id         :integer          not null, primary key
#  name       :string
#  rate       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Stylist <  ActiveRecord::Base
    has_many :appointments
    has_many :users, through: :appointments
end
