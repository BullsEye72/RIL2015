class Article < ActiveRecord::Base
  belongs_to :article_group
  belongs_to :value_added_tax
end
