module FortuneOfDecades
  class ValueDecorator < ApplicationDecorator
    delegate_all

    def gogyo_values
      gogyo.sorted_values(person.nisshu.gogyo).values
    end
  end
end
