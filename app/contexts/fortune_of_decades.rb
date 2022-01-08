# 大運表示用モジュール
module FortuneOfDecades
  extend ActiveSupport::Concern

  # 運の表示情報
  class FortuneValue
    include ActiveModel::Model
    include ActiveModel::Attributes

    attribute :person
    attribute :date
    attribute :fortune
    attribute :gogyo

    def self.build(person:, range:)
      result_range, fortune_range = get_ranges(person: person, range: range)
      return if result_range.nil?

      fortune, gogyo = get_fortune_gogyo(person: person, range: fortune_range)
      gogyo.filter_cover(result_range).map do |date_range, gogyo_point|
        _, fortune_point = fortune.find_by_date(date_range.min)

        new(person: person, date: date_range.min, fortune: fortune_point, gogyo: gogyo_point + person.gogyo_value)
      end
    end

    class << self
      private def get_ranges(person:, range:)
        date_of_birth = person.datetime_of_birth.to_date
        range_min, range_max = range.minmax
        return [nil, nil, nil] if date_of_birth > range_max

        [[range_min, date_of_birth].max..range_max, (range_max.year - date_of_birth.year).years]
      end

      private def get_fortune_gogyo(person:, range:)
        fortune = person.fortune_of_decades(range: range)
        [fortune, fortune.gogyo_values]
      end
    end
  end
end
