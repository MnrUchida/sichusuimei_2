class Junishi < ActiveHash::Base
  self.data = [
    { key: 'ne', gogyo: :mizu, inyou: :outward, pos: 0, tentoku: %i[mi saru] },
    { key: 'ushi', gogyo: :tsuchi, gogyo_2: :mizu, inyou: :inward, pos: 1, tentoku: %i[kanoe kinoto] },
    { key: 'tora', gogyo: :ki, inyou: :outward, pos: 2, tentoku: %i[mizunoe hinoto] },
    { key: 'u', gogyo: :ki, inyou: :inward, pos: 3, tentoku: %i[mi saru] },
    { key: 'tatsu', gogyo: :tsuchi, gogyo_2: :ki, inyou: :outward, pos: 4, tentoku: %i[mizunoe hinoto] },
    { key: 'mi', gogyo: :hi, inyou: :inward, pos: 5, tentoku: %i[hinoe kanoto] },
    { key: 'uma', gogyo: :hi, inyou: :outward, pos: 6, tentoku: %i[tora i] },
    { key: 'hitsuji', gogyo: :tsuchi, gogyo_2: :hi, inyou: :inward, pos: 7, tentoku: %i[kinoe tsuchinoto] },
    { key: 'saru', gogyo: :kane, inyou: :outward, pos: 8, tentoku: %i[tsuchinoe mizunoto] },
    { key: 'tori', gogyo: :kane, inyou: :inward, pos: 9, tentoku: %i[tora i] },
    { key: 'inu', gogyo: :tsuchi, gogyo_2: :kane, inyou: :outward, pos: 10, tentoku: %i[hinoe kanoto] },
    { key: 'i', gogyo: :mizu, inyou: :inward, pos: 11, tentoku: %i[kanoe kinoto] }
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
      Junishi.where(key: tentoku)
    else
      Jikkan.where(key: tentoku)
    end
  end

  def next(direction)
    Junishi.find_by(pos: (pos + direction) % 12)
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
