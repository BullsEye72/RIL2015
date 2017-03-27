# == Schema Information
#
# Table name: house_modules
#
#  id                 :integer          not null, primary key
#  module_range_id    :integer
#  name               :string
#  description        :string
#  default            :boolean
#  drawing_id         :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  price              :decimal(, )
#  lowest_price       :decimal(, )
#  lowest_price_w_vat :decimal(, )
#
# Indexes
#
#  index_house_modules_on_drawing_id       (drawing_id)
#  index_house_modules_on_module_range_id  (module_range_id)
#

class HouseModule < ActiveRecord::Base
  belongs_to :module_range
  #belongs_to :layout
  belongs_to :drawing
  
  has_many :articles_modules
  has_many :articles, through: :articles_modules

  def add_articles_modules(article_ids)
    articles_modules.each {|am| am.destroy}
    position=0
    article_ids.each do |article_id|
      ArticlesModule.create!(
          house_module: self,
          article_id: article_id,
          drawing_position: position+=1
      )
    end
  end
  
  def module_price
    if self.lowest_price.nil?
      price = 0
      self.articles.each{|a| price += a.lowest_price}
      self.lowest_price = price
      self.save
    end
    
    return self.lowest_price
  end
  
  def module_price_w_vat
    if self.lowest_price_w_vat.nil?
      price = 0
      self.articles.each{|a| price += a.lowest_price_w_vat}
      self.lowest_price_w_vat = price
      self.save
    end
    
    return self.lowest_price_w_vat
  end

end
