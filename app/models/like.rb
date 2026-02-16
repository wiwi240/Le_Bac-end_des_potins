class Like < ApplicationRecord
  belongs_to :user
  belongs_to :gossip

  # Garantit qu'un utilisateur ne peut liker un potin qu'une seule fois
  validates :user_id, uniqueness: { scope: :gossip_id }
end