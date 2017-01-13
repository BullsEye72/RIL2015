class Order < ActiveRecord::Base
  belongs_to :supplier
  belongs_to :quote
end
