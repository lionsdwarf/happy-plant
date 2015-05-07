class Plant < ActiveRecord::Base
  belongs_to :user

  validates :name,
            presence: true
  validates :plant_type,
            presence: true
  validates :stamina,
            presence: true,
            numericality: { only_integer: true,
                            greater_than: 0,
                            less_than: 31 }

end