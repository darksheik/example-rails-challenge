class Charge < ActiveRecord::Base
  belongs_to :customer, :polymorphic => true
end
