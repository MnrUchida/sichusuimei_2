class PersonDecorator < ApplicationDecorator
  delegate_all

  def gogyo_hash
    gogyo_value.sorted_values(nisshu.gogyo).transform_keys(&:name)
  end
end
