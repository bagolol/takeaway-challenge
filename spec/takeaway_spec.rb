require 'takeaway'

describe Takeaway do

  it 'has a menu' do
    takeaway = Takeaway.new { Twillio.new }
    expect(takeaway.list).not_to be_empty
  end

  it 'can add an order' do
    takeaway = Takeaway.new { Twillio.new }
    subject.register_order('red curry' => 5)
    expect(subject.order).to eq ([{ 'red curry' => 5 }])
  end

  it 'can confirm an order' do
    takeaway = Takeaway.new { Twillio.new }
    time = Time.new
    subject.register_order('red curry' => 5)
    subject.calculate_order
    expect(subject.confirmation).to eq("Thank you! Your order was placed and will be delivered before #{(time.hour) + 1}:#{time.min}. The amount due is 5$.")

  end

end
