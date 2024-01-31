class Relationship < ApplicationRecord
    belongs_to :active, class_name: "User", foreign_key: "follower_id"
    belongs_to :passive, class_name: "User", foreign_key: "followed_id"
end
