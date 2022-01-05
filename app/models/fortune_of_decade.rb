class FortuneOfDecade
  include Fortune

  class Point < Fortune::Point
    private def gogyo_value_shi_value
      return { chishi_data.gogyo => 3 } if chishi_data.gogyo != :tsuchi
      return { tsuchi: 1, chishi_data.gogyo_2 => 2 } if zoukan_data.gogyo != :tsuchi

      value = chishi_data.inyou == :outward ? 3 : 2
      { tsuchi: value, chishi_data.gogyo_2 => 1 }
    end

    def gogyo_value
      super + person.gogyo_value
    end

    def gogyo_hash
      gogyo_value.sorted_hash(person.nisshu.gogyo)
    end
  end
  Point.step = 10.years
  self.point = Point

  def gogyo_hash(count)
    initial = sorted_gogyo_keys.to_h { |gogyo| [gogyo.key.to_s, []] }
    take(count).inject(initial) do |result, (date, fortune)|
      result['dates'] = (result['dates'] || []) + [date]
      result.merge(fortune.gogyo_value.attributes) { |_, oldval, newval| oldval << newval }
    end
  end

  def sorted_gogyo_keys
    gogyo_keys = Gogyo.order(:value).to_a
    start_index = gogyo_keys.find_index { |gogyo| gogyo.key == person.nisshu.gogyo }
    gogyo_keys[start_index..-1] + gogyo_keys[0...start_index]
  end
end
