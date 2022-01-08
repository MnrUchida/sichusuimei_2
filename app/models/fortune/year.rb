# 運モジュール
module Fortune
  # 流年運
  class Year
    include Base

    class Point < Base::Point
      private def calc_date(value)
        season = Season.assume_season(range.first)
        Season.assume_season(Date.new(season.year + value, 2, 15)).division_date.to_date
      end
    end
    self.point = Point
  end
end
