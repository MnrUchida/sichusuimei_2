class Jikkan < ActiveHash::Base
  self.data = [
    { key: 'kinoe', gogyo: :ki, inyou: :outward, gouka: :tsuchinoe, pos: 0 },
    { key: 'kinoto', gogyo: :ki, inyou: :inward, gouka: :kanoto, pos: 1 },
    { key: 'hinoe', gogyo: :hi, inyou: :outward, gouka: :mizunoe, pos: 2 },
    { key: 'hinoto', gogyo: :hi, inyou: :inward, gouka: :kinoto, pos: 3 },
    { key: 'tsuchinoe', gogyo: :tsuchi, inyou: :outward, gouka: :hinoe, pos: 4 },
    { key: 'tsuchinoto', gogyo: :tsuchi, inyou: :inward, gouka: :tsuchinoto, pos: 5 },
    { key: 'kanoe', gogyo: :kane, inyou: :outward, gouka: :kanoe, pos: 6 },
    { key: 'kanoto', gogyo: :kane, inyou: :inward, gouka: :mizunoto, pos: 7 },
    { key: 'mizunoe', gogyo: :mizu, inyou: :outward, gouka: :kinoe, pos: 8 },
    { key: 'mizunoto', gogyo: :mizu, inyou: :inward, gouka: :hinoto, pos: 9 }
  ]

  def relation(other)
    self_gogyo = Gogyo.find_by(key: gogyo)
    other_gogyo = Gogyo.find_by(key: other.gogyo)
    Hentsusei.find_by(relation: self_gogyo.relation(other_gogyo), inyou: inyou_relation(other))
  end

  def gogyo_data() = Gogyo.find_by(key: gogyo)

  def kangou?(other)
    case gogyo_data.relation(other.gogyo_data)
    when :restraint_to
      inyou == :outward && other.inyou == :inward
    when :restraint_from
      inyou == :inward && other.inyou == :outward
    else
      false
    end
  end

  def next(direction)
    Jikkan.find_by(pos: (pos + direction) % 10)
  end

  private def inyou_relation(other)
    inyou == other.inyou ? :same : :different
  end
end
