class Junishi < ActiveHash::Base
  self.data = [
    { key: :ne, gogyo: :mizu, inyou: :outward, pos: 0, tentoku_value: %i[mi saru], name: '子' },
    { key: :ushi, gogyo: :tsuchi, inyou: :inward, pos: 1, tentoku_value: %i[kanoe kinoto], name: '丑',
      gogyo_2: :mizu },
    { key: :tora, gogyo: :ki, inyou: :outward, pos: 2, tentoku_value: %i[mizunoe hinoto], name: '寅' },
    { key: :u, gogyo: :ki, inyou: :inward, pos: 3, tentoku_value: %i[mi saru], name: '卯'  },
    { key: :tatsu, gogyo: :tsuchi, inyou: :outward, pos: 4, tentoku_value: %i[mizunoe hinoto], name: '辰',
      gogyo_2: :ki },
    { key: :mi, gogyo: :hi, inyou: :inward, pos: 5, tentoku_value: %i[hinoe kanoto], name: '巳' },
    { key: :uma, gogyo: :hi, inyou: :outward, pos: 6, tentoku_value: %i[tora i], name: '午' },
    { key: :hitsuji, gogyo: :tsuchi, inyou: :inward, pos: 7, tentoku_value: %i[kinoe tsuchinoto], name: '未',
      gogyo_2: :hi },
    { key: :saru, gogyo: :kane, inyou: :outward, pos: 8, tentoku_value: %i[tsuchinoe mizunoto], name: '申' },
    { key: :tori, gogyo: :kane, inyou: :inward, pos: 9, tentoku_value: %i[tora i], name: '酉' },
    { key: :inu, gogyo: :tsuchi, inyou: :outward, pos: 10, tentoku_value: %i[hinoe kanoto], name: '戌',
      gogyo_2: :kane },
    { key: :i, gogyo: :mizu, inyou: :inward, pos: 11, tentoku_value: %i[kanoe kinoto], name: '亥' }
  ]

  def gogyo_data() = Gogyo.find_by(key: gogyo)
  def gogyo_data2() = Gogyo.find_by(key: gogyo_2)

  def relation(jikkan)
    sign = jikkan.inyou == :outward ? 1 : -1
    Houn.find_by(distance: (distance(Junishi.strong_season(jikkan)) * sign) % 12)
  end

  def chu?(other)
    distance(other) == 6
  end

  def tentoku
    if %i[ne u tori].include? key
      Junishi.where(key: tentoku_value)
    else
      Jikkan.where(key: tentoku_value)
    end
  end

  def +(value)
    Junishi.find_by(pos: (pos + value) % 12)
  end

  private def distance(other)
    (pos - other.pos) % 12
  end

  def self.strong_season(jikkan)
    gogyo = jikkan.gogyo == :tsuchi ? :hi : jikkan.gogyo
    order = jikkan.inyou == :outward ? :asc : :desc
    where(gogyo: gogyo).order(pos: order).first
  end
end
