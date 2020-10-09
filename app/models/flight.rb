class Flight < ApplicationRecord
  belongs_to :origination, class_name: 'Airport'
  belongs_to :destination, class_name: 'Airport'

  def self.dep_dates
    Flight.distinct.pluck(:dep_date).map { |date| date.strftime('%m/%d/%Y') }
  end
end
