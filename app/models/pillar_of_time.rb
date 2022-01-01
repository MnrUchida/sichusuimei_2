# == Schema Information
#
# Table name: pillar_of_times
#
#  id        :integer          not null, primary key
#  chishi    :integer          not null
#  tenkan    :integer          not null
#  zoukan    :integer          not null
#  person_id :integer
#
# Indexes
#
#  index_pillar_of_times_on_person_id  (person_id)
#
class PillarOfTime < ApplicationRecord
  include Pillar

  before_validation :set_tenkan
  before_validation :set_chishi
  before_validation :set_zoukan

  private def set_tenkan() = self.tenkan ||= time % 10
  private def set_chishi() = self.chishi ||= (person.datetime_of_birth.hour / 2.0).ceil % 12

  def time
    ((person.days_of_current_day + 4) % 10 * 12) + (person.datetime_of_birth.hour / 2.0).ceil
  end
end
