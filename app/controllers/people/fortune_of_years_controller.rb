# 個人
module People
  # 流年運
  class FortuneOfYearsController < ApplicationController
    include FortuneOfYears
    before_action :set_person

    def index
      range = range_start..(range_start + 10.years)
      @fortune_of_years = CollectionDecorator.decorate(FortuneValue.build(person: @person, range: range))
    end

    def show
      range = convert_date(params[:id])..(convert_date(params[:id]) + 1.year)
      @fortune_of_year = ValueDecorator.decorate(FortuneValue.build(person: @person, range: range).first)
      @fortune_of_decade = DecadeValue.build(person: @person, range: range).first
    end

    private def set_person
      @person = Person.find(params[:person_id])
    end

    private def range_start
      convert_date(params[:range_start])
    end

    private def convert_date(date)
      return Time.zone.today if date.blank?

      start_date = Date.parse(date.to_s)
      @person.datetime_of_birth > start_date ? @person.datetime_of_birth.to_date : start_date
    end
  end
end
