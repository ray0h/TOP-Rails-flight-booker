class Flight < ApplicationRecord
  belongs_to :depart, class_name: 'Airport'
  belongs_to :arrival, class_name: 'Airport'

  has_many :bookings

  def self.dep_dates
    Flight.order(:dep_date).distinct.pluck(:dep_date)
  end

  def self.search(params)
    return nil unless params

    Flight.where(arrival_id: params['arr_air'], depart_id: params['dep_air'], dep_date: params['dep_date'])
  end
end
