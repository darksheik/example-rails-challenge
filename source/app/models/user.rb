class User < ActiveRecord::Base
  has_many :charges, :as => :customer
end
