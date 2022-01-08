class GogyoValue
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :ki, default: 0
  attribute :hi, default: 0
  attribute :tsuchi, default: 0
  attribute :kane, default: 0
  attribute :mizu, default: 0

  def +(value)
    GogyoValue.new(attributes.merge(value.attributes) { |_, oldval, newval| newval + oldval })
  end

  def sorted_values(start)
    sorted_keys(start).to_h { |gogyo| [gogyo, attributes[gogyo.key.to_s]] }
  end

  private def sorted_keys(start)
    gogyo_keys = Gogyo.order(:value).to_a
    start_index = gogyo_keys.find_index { |gogyo| gogyo.key == start }
    gogyo_keys[start_index..-1] + gogyo_keys[0...start_index]
  end
end
