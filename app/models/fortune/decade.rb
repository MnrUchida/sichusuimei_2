# 運モジュール
module Fortune
  # 大運
  class Decade
    include Base

    class Point < Base::Point
      private def gogyo_value_shi_value
        return { chishi_data.gogyo => 3 } if chishi_data.gogyo != :tsuchi
        return { tsuchi: 1, chishi_data.gogyo_2 => 2 } if zoukan_data.gogyo != :tsuchi

        value = chishi_data.inyou == :outward ? 3 : 2
        { tsuchi: value, chishi_data.gogyo_2 => 1 }
      end

      private def calc_range(value) = calc_date(value - 1)...calc_date(value)
      private def calc_date(value)  = range.last.to_date + (value * 10).years
    end
    self.point = Point
  end
end
