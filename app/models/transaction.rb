class Transaction < ActiveRecord::Base
  validates :sum, presence: true
  belongs_to :user, touch: true

end
