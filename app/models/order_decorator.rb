Spree::Order.class_eval do
  require 'date'

  state_machine.before_transition to: :payment, do: :delivery_date_specific_validation

  attr_accessible :delivery_date

  validates :delivery_date, presence: true

  def delivery_date_specific_validation
    cutoff = Time.zone.now.change(hour: 16, min: 00)

    if [0, 7].include?(delivery_date.wday)
      errors.add(:delivery_date, I18n.t('activerecord.errors.models.spree/order.attributes.delivery_date.nor_monday_sunday'))
    end

    if cutoff.past? && !(delivery_date > Date.tomorrow)
      errors.add(:delivery_date, I18n.t('activerecord.errors.models.spree/order.attributes.delivery_date.too_late_tomorrow'))
    elsif !cutoff.past? && !(delivery_date > Date.today)
      errors.add(:delivery_date, I18n.t('activerecord.errors.models.spree/order.attributes.delivery_date.too_late_today'))
    end
  end
end
