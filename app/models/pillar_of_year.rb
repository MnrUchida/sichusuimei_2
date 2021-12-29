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
end
