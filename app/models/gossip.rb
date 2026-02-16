class Gossip < ApplicationRecord
  belongs_to :user
  has_many :join_table_tag_gossips
  has_many :tags, through: :join_table_tag_gossips
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { minimum: 3, maximum: 14 }
  validates :content, presence: true
end