class User < ActiveRecord::Base
  validates :name, presence: true
  has_many :transactions, dependent: :destroy

  def increase=(sum)
    self.transactions.create!(sum: sum)
  end

  def decrease=(sum)
    self.transactions.create!(sum: -(sum.to_i))
  end

  def total_points
    Transaction.where(user_id: self.id).sum(:sum)
  end




end
