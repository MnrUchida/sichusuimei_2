class FortuneOfYear
  include Fortune

  class Point < Fortune::Point
    def gogyo_value
      super + person.gogyo_value + fortune_of_decade.gogyo_value
    end

    def gogyo_hash
      gogyo_value.sorted_hash(person.nisshu.gogyo)
    end

    private def fortune_of_decade
      person.fortune_of_decades.find { |key, _| (key - 10.years) < date && key >= date }[1]
    end
  end
  Point.step = 1.years
  self.point = Point
end
