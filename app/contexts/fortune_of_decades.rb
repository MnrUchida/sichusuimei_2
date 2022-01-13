require_relative 'concerns/fortune_value'

# 大運表示用モジュール
module FortuneOfDecades

  # 運の表示情報
  class FortuneValue
    include ::FortuneValue

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
