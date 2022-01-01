class ZoukanRatio
  include Singleton

  def ratios
    {
      tora: { 23.3 => :tsuchinoe, 46.6 => :hinoe, 100.0 => :kinoe }, u: { 33.0 => :kinoe, 100.0 => :kinoto },
      tatsu: { 30.0 => :kinoto, 40.0 => :mizunoto, 100.0 => :tsuchinoe },
      mi: { 23.4 => :tsuchinoe, 46.8 => :kanoe, 100.0 => :hinoe },
      uma: { 33.0 => :hinoe, 57.0 => :tsuchinoto, 100.0 => :hinoto },
      hitsuji: { 30.0 => :hinoto, 40.0 => :kinoto, 100.0 => :tsuchinoto },
      saru: { 23.6 => :tsuchinoto, 46.8 => :mizunoe, 100.0 => :kanoe }, tori: { 33.5 => :kanoe, 100.0 => :kanoto },
      inu: { 30.0 => :kanoto, 40.0 => :hinoto, 100.0 => :tsuchinoe },
      i: { 24.2 => :tsuchinoe, 46.8 => :kinoe, 100.0 => :mizunoe },
      ne: { 33.5 => :mizunoe, 100.0 => :mizunoto }, ushi: { 29.7 => :mizunoto, 40.0 => :kanoto, 100.0 => :tsuchinoto }
    }
  end

  def initialize
    @zoukans = ratios.transform_values { |ratios| ratios.map { |ratio, kan| Zoukan.new(ratio: ratio, jikkan: kan) } }
  end

  def zoukan_in_chishi(chishi, ratio)
    @zoukans[chishi.to_sym].find { |zoukan| zoukan.ratio > ratio }&.jikkan
  end

  class Zoukan
    include ActiveModel::Model
    include ActiveModel::Attributes

    attribute :ratio
    attribute :jikkan
  end
end

