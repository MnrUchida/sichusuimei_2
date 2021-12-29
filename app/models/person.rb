# frozen_string_literal: true

# == Schema Information
#
# Table name: people
#
#  id                :integer          not null, primary key
#  datetime_of_birth :datetime         not null
#  name              :string
#  sex               :integer          not null
#
class Person < ApplicationRecord
  has_one :pillar_of_year
  has_one :pillar_of_month
  has_one :pillar_of_day
  has_one :pillar_of_time

  validates :datetime_of_birth, presence: true
  validates :sex, presence: true

  enum sex: { male: 0, female: 1 }

  def spent_time_in_season

  end
end
