class ItemTag < ApplicationRecord
  belongs_to :tag
  belongs_to :item

  validates_uniqueness_of :tag_id, scope: :item_id
end
