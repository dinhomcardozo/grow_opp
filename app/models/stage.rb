class Stage < ApplicationRecord
    validates :stage_name, presence: true, uniqueness: true
end