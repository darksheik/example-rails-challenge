class ChargeObserver < ActiveRecord::Observer
  def before_create(charge)
    charge.unique_code = SecureRandom.hex(5)
  end
end
