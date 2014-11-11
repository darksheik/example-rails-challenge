class User < ActiveRecord::Base
  has_many :charges, :as => :customer

  def display_name
    [first_name,' ',last_name].join
  end
end
