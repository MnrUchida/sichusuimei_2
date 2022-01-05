# 個人
module People
  # 大運
  class FortuneOfDecadesController < ApplicationController
    before_action :set_person

    def index
      @fortune_of_decades = @person.fortune_of_decades
    end

    def show
    end

    private def set_person
      @person = Person.find(params[:person_id])
    end
  end
end
