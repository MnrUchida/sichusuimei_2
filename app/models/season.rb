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
  before_create :set_year_month

  scope :with_around_season, lambda { |date|
    where(division_date: date.prev_month.beginning_of_month..date.next_month.end_of_month)
  }

  def self.update_season_seconds(date)
    date = date.to_date.change(day: 1)
    seasons = with_around_season(date).index_by { |season| season.division_date.to_date.change(day: 1) }
    current = seasons[date]
    return if current.blank?

    current.update_season_seconds(seasons[date.next_month])
    seasons[date.prev_month]&.update_season_seconds(current)
  end

  def update_season_seconds(after_season)
    seconds = if after_season.present?
                after_season.division_date - division_date
              else
                Season.where(month: month).average(:seconds)
              end
    update!(seconds: seconds)
  end

  def self.season_division_date(date)
    month = date.month
    year = month > 1 ? date.year : date.year - 1
    find_by(year: year, month: month) || assume_season_division_date(year: year, month: month)
  end

  class << self
    private def assume_season_division_date(year:, month:)
      season = Season.where(month: month).order(sanitize_sql_for_order(['ABS(year - ?)', year])).first
      sign = season.year <=> year
      season.division_date - sign * (season.year - year) * year_seconds_average
    end

    private def year_seconds_average
      seconds = group(:year).having('COUNT(*) >= 12').sum(:seconds)
      seconds.values.sum / seconds.count
    end
  end

  private def set_year_month
    self.year = division_date.month > 1 ? division_date.year : division_date.prev_year
    self.month = division_date.month
  end
end
