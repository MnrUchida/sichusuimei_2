class FortuneOfDecade
  include Fortune

  private def gogyo_value_shi
    return { chishi_data.gogyo => 3 } if chishi_data.gogyo != :tsuchi
    return { tsuchi: 1, chishi_data.gogyo_2 => 2 } if zoukan_data.gogyo != :tsuchi

    value = chishi_data.inyou == :outward ? 3 : 2
    { tsuchi: value, chishi_data.gogyo_2 => 1 }
  end

  private def step() = 10.years
end
