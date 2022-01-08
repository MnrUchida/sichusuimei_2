# 個人
module People
  # 大運
  class FortuneOfDecadesController < ApplicationController
    include FortuneOfDecades
    before_action :set_person

    def index
      range = @person.datetime_of_birth.to_date..(@person.datetime_of_birth.to_date + 100.years)
      @fortune_of_decades = CollectionDecorator.decorate(FortuneValue.build(person: @person, range: range))
    end

    #　デコレータを導入する
    def show
    end

    private def set_person
      @person = Person.find(params[:person_id])
    end
  end
end
