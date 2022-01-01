# == Schema Information
#
# Table name: pillar_of_months
#
#  id        :integer          not null, primary key
#  chishi    :integer          not null
#  tenkan    :integer          not null
#  zoukan    :integer          not null
#  person_id :integer
#
# Indexes
#
#  index_pillar_of_months_on_person_id  (person_id)
#
class PillarOfMonth < ApplicationRecord
  include Pillar

  before_validation :set_tenkan
  before_validation :set_chishi
  before_validation :set_zoukan

  delegate :tentoku, to: :chishi_data

  def strength
    super + getsurei
  end

  private def getsurei
    gogyo_data = if chishi_data.gogyo == :tsuchi && zoukan_data.gogyo != :tsuchi
                   chishi_data.gogyo_data2
                 else
                   chishi_data.gogyo_data
                 end
    relation_strength[gogyo_data.relation(person.nisshu.gogyo_data)]
  end

  private def set_tenkan() = self.tenkan ||= (person.season.month_elapsed - 8) % 10
  private def set_chishi() = self.chishi ||= person.season.month % 12

  private def gogyo_value_shi
    return { chishi_data.gogyo => 3 } if chishi_data.gogyo != :tsuchi
    return { tsuchi: 1, chishi_data.gogyo_2 => 2 } if zoukan_data.gogyo != :tsuchi

    value = chishi_data.inyou == :outward ? 3 : 2
    { tsuchi: value, chishi_data.gogyo_2 => 1 }
  end

  private def relation_strength
    {
      same_kind: 6,
      support_to: 3,
      support_from: 0,
      restraint_from: -3,
      restraint_to: -6
    }
  end
end
