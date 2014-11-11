class Charge < ActiveRecord::Base
  belongs_to :customer, :polymorphic => true

  scope :successful, lambda { where(:paid => true, :refunded => false) }
  scope :disputed,   lambda { where(:paid => true, :refunded => true) }
  scope :failed,     lambda { where(:paid => false) }

  def unique_code_url
    ['/charges/',unique_code].join
  end
end
