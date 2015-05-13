class Recipient < ActiveRecord::Base

  belongs_to :user

  validates :name,
            presence: true
  validates :phone_num,
            presence: true
  # validates :notification_time,
  #           presence: true

end