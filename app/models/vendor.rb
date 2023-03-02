class Vendor < ApplicationRecord
  validates :title, presence: true

  #paranoia軟刪除
  acts_as_paranoid
end
