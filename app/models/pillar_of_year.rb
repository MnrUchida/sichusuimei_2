# == Schema Information
#
# Table name: pillar_of_years
#
#  id        :integer          not null, primary key
#  chishi    :integer          not null
#  tenkan    :integer          not null
#  zoukan    :integer          not null
#  person_id :integer
#
# Indexes
#
#  index_pillar_of_years_on_person_id  (person_id)
#
class PillarOfYear < ApplicationRecord
  include Pillar

  before_validation :set_tenkan
  before_validation :set_chishi
  before_validation :set_zoukan

  private def set_tenkan() = self.tenkan ||= (person.season.year - 4) % 10
  private def set_chishi() = self.chishi ||= (person.season.year - 4) % 12

  def nacchin
    case Nacchin.find_by(gogyo: tenkan_data.gogyo, junishi: chishi).result
    when :hi
      (tenkan == :kanoe && chishi == :tatsu) || (tenkan == :tsuchinoe && chishi == :inu)
    when :kane
      tenkan == :kanoe && chishi == :inu
    when :mizu
      tenkan == :mizunoe && chishi == :tatsu
    else
      false
    end
  end
end
