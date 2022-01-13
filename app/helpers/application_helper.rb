module ApplicationHelper
  def strength_word(strength)
    if strength > 5
      '身旺'
    elsif strength > 0
      '中強'
    elsif strength > -5
      '中弱'
    else
      '身弱'
    end
  end

  def kubou_class(junihsi, person)
    'kubou' if person.kubou.include?(junihsi)
  end

  def tentoku_class(kanshi, person)
    'tentoku' if person.tentoku.include?(kanshi)
  end

  def person_params(person)
    { person: { datetime_of_birth: person.datetime_of_birth, sex: person.sex } }
  end
end
