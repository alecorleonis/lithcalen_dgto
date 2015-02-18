class List < ActiveRecord::Base
attr_accessible :user_id, :list_name
belongs_to :user
has_many :items
end
