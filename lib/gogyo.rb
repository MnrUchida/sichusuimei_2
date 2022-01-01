class Gogyo < ActiveHash::Base
  self.data = [
    { key: :ki, name: '木', value: 0 },
    { key: :hi, name: '火', value: 1 },
    { key: :tsuchi, name: '土', value: 2 },
    { key: :kane, name: '金', value: 3 },
    { key: :mizu, name: '水', value: 4 }
  ]

  def self.relations
    {
      0 => :same_kind,
      1 => :support_to,
      2 => :restraint_to,
      3 => :restraint_from,
      4 => :support_from
    }
  end

  def relation(other)
    self.class.relations[(other.value - value) % 5]
  end
end
