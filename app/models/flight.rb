class Flight < ApplicationRecord
  belongs_to :origination, class_name: 'Airport'
  belongs_to :destination, class_name: 'Airport'

  has_many :bookings
  has_many :passengers, through: :bookings

  def self.dep_dates
    Flight.order(:dep_date).distinct.pluck(:dep_date)
    # .map { |date| date.strftime('%m/%d/%Y') }
  end

  def self.search(params)
    return nil unless params

    Flight.where(destination_id: params['arr_air'], origination_id: params['dep_air'], dep_date: params['dep_date'])
  end
end
