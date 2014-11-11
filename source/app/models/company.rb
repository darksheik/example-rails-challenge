class Company < ActiveRecord::Base
  has_many :charges, :as => :customer

  def display_name
    name
  end
end
