class Transaction < ActiveRecord::Base

  belongs_to :user, touch: true

end
