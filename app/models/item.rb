class Item < ActiveRecord::Base
attr_accessible :list_id, :item_name, :item_description, :item_rating, :item_recommendation
belongs_to :list
end
