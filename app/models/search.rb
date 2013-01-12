# coding: utf-8
#activerecordを継承していないモデル
class Search
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :title

  #validates :title,:str_length => true
  validate :str_length

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end


  def persisted?
    false
  end

  private
  def str_length
   errors.add(:title,"5文字以下にしてください") if 5 <= title.size
  end
end