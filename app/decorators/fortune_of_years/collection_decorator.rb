module FortuneOfYears
  # コレクションデコレータ
  class CollectionDecorator < Draper::CollectionDecorator
    def decorator_class
      ValueDecorator
    end

    def dates() = @dates ||= map(&:date)

    def gogyo_hash
      return if blank?

      @gogyo_hash ||= inject(initial_hash) do |result, value|
        result.merge(value.gogyo.attributes) { |_, oldval, newval| oldval << newval }
      end
    end

    def gogyo
      person = first.person
      person.gogyo_value.sorted_values(person.nisshu.gogyo)
    end

    def path_to_index(years)
      h.person_fortune_of_years_path(range_start: dates.min + years.years)
    end

    private def initial_hash
      gogyo.to_h { |key, _| [key.key.to_s, []] }
    end
  end
end
