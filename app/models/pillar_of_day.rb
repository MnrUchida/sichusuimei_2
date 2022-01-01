# == Schema Information
#
# Table name: pillar_of_days
#
#  id        :integer          not null, primary key
#  chishi    :integer          not null
#  tenkan    :integer          not null
#  zoukan    :integer          not null
#  person_id :integer
#
# Indexes
#
#  index_pillar_of_days_on_person_id  (person_id)
#
class PillarOfDay < ApplicationRecord
  include Pillar

  before_validation :set_tenkan
  before_validation :set_chishi
  before_validation :set_zoukan

  private def set_tenkan() = self.tenkan ||= (person.days_of_current_day + 4) % 10
  private def set_chishi() = self.chishi ||= (person.days_of_current_day + 2) % 12

  def tenkan_hentsusei() = person.nisshu.relation(person.teikou)

  def kubou
    start = (chishi_data.pos - tenkan_data.pos + 10) % 12
    Junishi.where(pos: [start, start + 1])
  end

  private def gogyo_value_kan
    { tenkan_data.gogyo => 1 }
  end
end
