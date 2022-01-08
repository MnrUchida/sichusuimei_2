# frozen_string_literal: true

# == Schema Information
#
# Table name: seasons
#
#  id            :integer          not null, primary key
#  division_date :datetime         not null
#  month         :integer
#  seconds       :decimal(, )
#  year          :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Season < ApplicationRecord
  class_attribute :seasons, default: {}

  before_create :set_year_month

  scope :with_around_season, lambda { |date|
    where(division_date: date.prev_month.beginning_of_month..date.next_month.end_of_month)
  }

  def self.update_season_seconds(date)
    current, seasons = init_around_season(date)
    return if current.blank?

    current.update_season_seconds(seasons[date.next_month])
    seasons[date.prev_month].update_season_seconds(current) if seasons.key?(date.prev_month)
  end

  def update_season_seconds(after_season)
    seconds = if after_season.present?
                after_season.division_date - division_date
              else
                Season.where(month: month).average(:seconds)
              end
    update!(seconds: seconds)
  end

  def month_elapsed
    division_date.year * 12 + division_date.month
  end

  # 未来日がどうなるか？
  def self.assume_season(date)
    season = _assume_season(year: date.year, month: date.month)
    season = _assume_season(year: date.prev_month.year, month: date.prev_month.month) if date < season.division_date
    season
  end

  def self.average_seconds_for_month(month)
    where(month: month).average(:seconds)
  end

  class << self
    private def init_around_season(date)
      date = date.to_date.change(day: 1)
      seasons = with_around_season(date).index_by { |season| season.division_date.to_date.change(day: 1) }
      [seasons[date], seasons]
    end

    private def assume_season_division_date(year:, month:)
      season = Season.where(month: month).order(sanitize_sql_for_order([Arel.sql('ABS(year - ?)'), year])).first
      sign = season.year <=> year
      season.division_date - sign * (season.year - year).abs * year_seconds_average
    end

    private def year_seconds_average
      seconds = group(:year).having('COUNT(*) >= 12').sum(:seconds)
      seconds.values.sum / seconds.count
    end

    private def _assume_season(year:, month:)
      work_year = year
      work_year -= 1 if month <= 1

      seasons["#{'%04d' % work_year}#{'%02d' % month}"] ||= find_or_initialize_by(year: work_year, month: month) do |season|
        season.division_date = assume_season_division_date(year: work_year, month: month)
        season.seconds = average_seconds_for_month(month)
      end
    end
  end

  private def set_year_month
    self.year = division_date.month > 1 ? division_date.year : division_date.prev_year
    self.month = division_date.month
  end
end
