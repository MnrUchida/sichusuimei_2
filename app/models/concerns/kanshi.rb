module Kanshi
  extend ActiveSupport::Concern

  def tenkan_data()      = Jikkan.find_by(key: tenkan)
  def zoukan_data()      = Jikkan.find_by(key: zoukan)
  def chishi_data()      = Junishi.find_by(key: chishi)

  def tenkan_hentsusei() = person.nisshu.relation(tenkan_data)
  def zoukan_hentsusei() = person.nisshu.relation(zoukan_data)
  def houn()             = chishi_data.relation(person.nisshu)

  def kangou?(other)     = tenkan_data.kangou?(other.tenkan_data)
  def gouka_piller()     = dup.tap { |result| result.tenkan = result.tenkan_data.gouka }
  def chu?(other)        = chishi_data.chu?(other.chishi_data)
  def tenkan_chishi()    = "#{tenkan}_#{chishi}".to_sym

  def gogyo_value
    gogyo_value_kan.merge(gogyo_value_shi) { |_, oldval, newval| newval + oldval }
  end

  def set_zoukan
    self.zoukan ||= ZoukanRatio.instance.zoukan_in_chishi(chishi, person.ratio_in_season)
  end

  private def gogyo_value_kan
    value = tenkan_data.inyou == :outward ? 1 : 0.5
    { tenkan_data.gogyo => value }
  end

  private def gogyo_value_shi
    if chishi_data.gogyo == :tsuchi
      value = chishi_data.inyou == :outward ? 1 : 0.5
      { tsuchi: value, chishi_data.gogyo_2 => 0.5 }
    else
      { chishi_data.gogyo => 1 }
    end
  end
end

