
class Takeaway

  attr_accessor :list, :order, :amount_due

  def initialize
    @list = { 'red curry' => 5, 'green curry' => 5 }
    @order = []
    @amount_due = 0
  end

  def register_order(item)
    order << item
    calculate_order
  end

  def calculate_order
    fail 'no order placed' if empty?
    @amount_due = order.flat_map(&:values).inject(:+)
    confirmation
  end

  def confirmation
    "Thank you! Your order was placed and will be delivered before #{delivery_time}. The amount due is #{amount_due}$."
  end

  def delivery_time
    hour = (Time.new.hour) + 1
    minute = Time.new.min
    "#{hour}:#{minute}"
  end

  def empty?
    order.empty?
  end
end







