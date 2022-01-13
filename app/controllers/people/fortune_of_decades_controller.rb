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

    private def set_person
      @person = Person.new(person_params)
      ActiveRecord::Base.transaction(joinable: false, requires_new: true) do
        @person.save!
        @person.create_pillars!(use_meikyu: params[:use_meikyu])
        raise ActiveRecord::Rollback
      end
    end

    private def person_params
      params.require(:person).permit(:datetime_of_birth, :sex, :name)
    end
  end
end
