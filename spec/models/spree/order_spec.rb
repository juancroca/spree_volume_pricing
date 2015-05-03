RSpec.describe Spree::Order, type: :model do
  before do
    @order = create(:order)
    @variant = create(:variant, price: 10)

    @variant_with_prices = create(:variant, price: 10)
    @variant_with_prices.volume_prices << create(:volume_price, range: '(1..5)', amount: 9)
    @variant_with_prices.volume_prices << create(:volume_price, range: '(5..9)', amount: 8)
  end

  context 'add_variant' do
    it 'uses the variant price if there are no volume prices' do
      @order.contents.add(@variant)
      expect(@order.line_items.first.price).to eq(10)
    end

    it 'uses the volume price if quantity falls within a quantity range of a volume price' do
      @variant.volume_prices << create(:volume_price, range: '(5..10)', amount: 9)
      @order.contents.add(@variant_with_prices, 7)
      expect(@order.line_items.first.price).to eq(8)
    end

    it 'uses the variant price if the quantity fails to satisfy any of the volume price ranges' do
      @order.contents.add(@variant, 10)
      expect(@order.line_items.first.price).to eq(10)
    end

    it 'uses the first matching volume price in the event of more then one matching volume prices' do
      @order.contents.add(@variant_with_prices, 5)
      expect(@order.line_items.first.price).to eq(8)
    end
  end
end
