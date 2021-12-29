module Pillar
  extend ActiveSupport::Concern

  included do
    include ActiveModel::Model
    include ActiveModel::Attributes

    attribute :tenkan
    attribute :chishi
    attribute :zoukan
  end

  def hentsusei

  end

  def houn

  end

  def kangou?(piller)

  end

  def kangou_piller

  end

  def kei?(piller)

  end

  def chu?(piller)

  end
end

