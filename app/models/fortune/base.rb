# 運モジュール
module Fortune
  # 運の集合の基底モジュール（大運、流年運）
  module Base
    extend ActiveSupport::Concern
    include ActiveModel::Model
    include ActiveModel::Attributes
    include Enumerable

    included do
      class_attribute :point
      attribute :person
      attribute :direction
      attribute :start_point
      attribute :start_date
      attribute :range

      self.point = Point
    end

    # 特定時点の運
    class Point
      include ActiveModel::Model
      include ActiveModel::Attributes
      include Kanshi

      attribute :person
      attribute :range
      attribute :tenkan
      attribute :chishi
      attribute :zoukan

      def +(value)
        self.class.new(person: person, tenkan: (tenkan_data + value).key, chishi: (chishi_data + value).key,
                       range: calc_date(value - 1)...calc_date(value)).tap(&:set_zoukan)
      end

      private def calc_date(value); end
    end

    # クラスメソッド
    module ClassMethods
      def build_data(person:, kanshi:, date:, direction: 1, range: 100.year)
        new(
          person: person, direction: direction, start_date: date, range: range,
          start_point: point.new(person: person, tenkan: kanshi.tenkan, chishi: kanshi.chishi,
                                 zoukan: kanshi.zoukan, range: person.datetime_of_birth.to_date...date)
        )
      end
    end

    def gogyo_values
      Gogyo.new.add(map { |range, point| { range: range, value: point.gogyo_value } })
    end

    def each
      value = 0
      loop do
        point = start_point + value * direction
        yield([point.range, point])
        value += 1
        break if point.range.first > (start_point.range.first + range)
      end
    end

    def find_by_date(date)
      find { |range, _| range.include?(date) }
    end
  end
end
