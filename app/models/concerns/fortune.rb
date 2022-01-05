# 運の基底モジュール（大運、流年運）
module Fortune
  extend ActiveSupport::Concern
  include ActiveModel::Model
  include ActiveModel::Attributes
  include Enumerable

  included do
    class_attribute :point
    self.point = Point
  end

  # 特定時点の運
  class Point
    include ActiveModel::Model
    include ActiveModel::Attributes
    include Kanshi

    class_attribute :step
    attr_accessor :person
    attr_accessor :tenkan
    attr_accessor :chishi
    attr_accessor :zoukan
    attr_accessor :date

    def +(value)
      self.class.new(person: person, tenkan: (tenkan_data + value).key,
                     chishi: (chishi_data + value).key, date: date + step
      ).tap(&:set_zoukan)
    end

    def gogyo_hash
      gogyo_value.sorted_hash(person.nisshu.gogyo)
    end
  end

  attr_accessor :person
  attr_accessor :direction
  attr_accessor :start_point
  attr_accessor :start_date

  # クラスメソッド
  module ClassMethods
    def build_data(person:, kanshi:, date:, direction: 1)
      new(
        person: person, direction: direction, start_date: date,
        start_point: point.new(person: person, tenkan: kanshi.tenkan, chishi: kanshi.chishi,
                               zoukan: kanshi.zoukan, date: date
        )
      )
    end
  end

  def each
    value = 0
    loop do
      yield([(start_date + value * point.step).to_date, start_point + value * direction])
      value += 1
    end
  end
end
