module FortuneValue
  extend ActiveSupport::Concern

  included do
    include ActiveModel::Model
    include ActiveModel::Attributes

    attribute :person
    attribute :date
    attribute :fortune
    attribute :gogyo
  end

  # クラスメソッド
  module ClassMethods
    def build(person:, range:)
      result_range, fortune_range = get_ranges(person: person, range: range)
      return if result_range.nil?

      fortune, gogyo = get_fortune_gogyo(person: person, range: fortune_range)
      fortune_array = fortune.to_a

      gogyo.filter_cover(result_range).map do |result|
        fortune_array = fortune_array[fortune_array.find_index { |date_range, _| date_range.include?(result.range.min) }..]
        new(person: person, date: result.range.min, fortune: fortune_array[0][1], gogyo: result.value + person.gogyo_value)
      end
    end

    private def get_ranges(person:, range:); end
    private def get_fortune_gogyo(person:, range:); end
  end
end
