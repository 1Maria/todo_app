class Todo < ActiveRecord::Base
  include RankedModel
  ranks :row_order
  belongs_to :user
end
