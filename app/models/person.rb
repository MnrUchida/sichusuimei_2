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

  delegate :kubou, to: :pillar_of_day
  delegate :tentoku, to: :pillar_of_month

  def create_pillars!(use_meikyu: false)
    update!(datetime_of_birth: datetime_of_birth.change(hour: meikyu_time)) if use_meikyu

    create_pillar_of_year!
    create_pillar_of_month!
    create_pillar_of_day!
    create_pillar_of_time!
  end

  def season
    @season ||= Season.assume_season(datetime_of_birth)
  end

  def spent_time_in_season
    datetime_of_birth - season.division_date
  end

  def ratio_in_season
    100.0 * spent_time_in_season / season.seconds
  end

  def days_of_current_day
    days_of_current_year(datetime_of_birth.prev_year.year) + datetime_of_birth.strftime("%j").to_i
  end

  def nisshu
    pillar_of_day.tenkan_data
  end

  def teikou
    pillar_of_month.zoukan_data
  end

  def direction
    (pillar_of_year.tenkan_data.inyou == :outward ? 1 : -1) * (male? ? 1 : -1)
  end

  def beginning_of_fortune
    month = ((direction > 0) ? (season.seconds - spent_time_in_season) : spent_time_in_season) / season.seconds * 10 * 12
    datetime_of_birth + month.round.months
  end

  def fortune_of_decades(range: 100.years)
    Fortune::Decade.build_data(person: self, kanshi: pillar_of_month, date: beginning_of_fortune, direction: direction, range: range)
  end

  def fortune_of_years(range: 100.years)
    Fortune::Year.build_data(person: self, kanshi: pillar_of_year, date: datetime_of_birth, range: range)
  end

  def gogyo_value
    [pillar_of_year, pillar_of_month, pillar_of_day, pillar_of_time].sum(&:gogyo_value)
  end

  def strength
    [pillar_of_year, pillar_of_month, pillar_of_day, pillar_of_time].sum(&:strength)
  end

  def kangou
    result = []
    result << '年月' if pillar_of_year.kangou?(pillar_of_month)
    result << '月日' if pillar_of_month.kangou?(pillar_of_day)
    result << '日時' if pillar_of_day.kangou?(pillar_of_time)
    result
  end

  def chu
    pillars = [pillar_of_year, pillar_of_month, pillar_of_day, pillar_of_time].combination(2).filter { |a, b| a.chu?(b) }
    pillars.map { |a, b| "#{a.model_name.human}#{b.model_name.human}" }
  end

  def kaigou?
    kanshi = pillar_of_day.tenkan_chishi
    case pillar_of_year.nacchin
    when :hi;   kanshi == :kanoe_tatsu || kanshi == :tsuchinoe_inu
    when :kane; kanshi == :kanoe_inu
    when :mizu; kanshi == :mizunoe_tatsu
    else; false
    end
  end

  private def meikyu_time
    shi = (season.month - datetime_of_birth.day + season.division_date.day + 6) % 12
    shi = 6 if shi.zero?
    shi * 2
  end

  private def days_of_current_year(year)
    year * 365 + (year / 4).truncate - (year / 100).truncate + (year / 400).truncate
  end
end
