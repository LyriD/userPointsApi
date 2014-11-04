class User < ActiveRecord::Base

  has_many :transactions, dependent: :destroy

  def increase=(sum)
    Transaction.create!(sum: sum, user_id: self.id)
  end

  def decrease=(sum)
    Transaction.create!(sum: -(sum.to_i), user_id: self.id)
  end

  def total_points
    Transaction.where(user_id: self.id).sum(:sum)
  end




end
