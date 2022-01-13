module FortuneOfYears
  class ValueDecorator < ApplicationDecorator
    delegate_all

    def gogyo_hash
      gogyo.sorted_values(person.nisshu.gogyo).transform_keys(&:name)
    end

    def gogyo_values
      gogyo.sorted_values(person.nisshu.gogyo).values
    end
  end
end
