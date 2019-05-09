# == Schema Information
#
# Table name: appointments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  stylist_id :integer
#  date       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Appointment < ActiveRecord::Base
    belongs_to :user
    belongs_to :stylist



end
