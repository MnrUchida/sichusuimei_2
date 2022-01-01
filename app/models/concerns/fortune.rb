# 運の基底モジュール（大運、流年運）
module Fortune
  extend ActiveSupport::Concern

  included do
    include ActiveModel::Model
    include ActiveModel::Attributes
    include Kanshi
  end

  attr_accessor :person
  attr_accessor :tenkan
  attr_accessor :chishi
  attr_accessor :zoukan
  attr_accessor :date
  attr_accessor :direction

  # クラスメソッド
  module ClassMethods
    def build_data(person:, kanshi:, date:, direction: 1)
      result = new
      result.attributes = { person: person, tenkan: kanshi.tenkan, chishi: kanshi.chishi, date: date, direction: direction }
      result.tap(&:set_zoukan)
    end
  end

  def next
    result = self.class.new
    result.attributes = {
      person: person, date: date + step, direction: direction,
      tenkan: tenkan_data.next(direction).key, chishi: chishi_data.next(direction).key
    }
    result.tap(&:set_zoukan)
  end
end
