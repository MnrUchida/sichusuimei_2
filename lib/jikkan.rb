class Jikkan < ActiveHash::Base
  self.data = [
    { key: :kinoe, gogyo: :ki, inyou: :outward, gouka: :tsuchinoe, pos: 0, name: '甲' },
    { key: :kinoto, gogyo: :ki, inyou: :inward, gouka: :kanoto, pos: 1, name: '乙' },
    { key: :hinoe, gogyo: :hi, inyou: :outward, gouka: :mizunoe, pos: 2, name: '丙' },
    { key: :hinoto, gogyo: :hi, inyou: :inward, gouka: :kinoto, pos: 3, name: '丁' },
    { key: :tsuchinoe, gogyo: :tsuchi, inyou: :outward, gouka: :hinoe, pos: 4, name: '戊' },
    { key: :tsuchinoto, gogyo: :tsuchi, inyou: :inward, gouka: :tsuchinoto, pos: 5, name: '己' },
    { key: :kanoe, gogyo: :kane, inyou: :outward, gouka: :kanoe, pos: 6, name: '庚' },
    { key: :kanoto, gogyo: :kane, inyou: :inward, gouka: :mizunoto, pos: 7, name: '辛' },
    { key: :mizunoe, gogyo: :mizu, inyou: :outward, gouka: :kinoe, pos: 8, name: '壬' },
    { key: :mizunoto, gogyo: :mizu, inyou: :inward, gouka: :hinoto, pos: 9, name: '癸' }
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

  def +(value)
    Jikkan.find_by(pos: (pos + value) % 10)
  end

  private def inyou_relation(other)
    inyou == other.inyou ? :same : :different
  end
end
