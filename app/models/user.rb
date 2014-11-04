class User < ActiveRecord::Base

  has_many :transactions, dependent: :destroy

  def increase=(sum)
    Transaction.create!(sum: sum, user_id: self.id)
  end

  def decrease=(sum)
    Transaction.create!(sum: -sum, user_id: self.id)
  end

  def total_points
    total=0
    self.transactions.each {|t| total+=t.sum}
    total
  end




end
