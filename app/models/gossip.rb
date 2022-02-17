class Gossip < ApplicationRecord
  belongs_to :user
  has_many :join_table_gossip_tags, dependent: :destroy #permet de ne pas être bloquer pour détruire un gossip
  has_many :tags, through: :join_table_gossip_tags

  has_many :comments
  has_many :likes, dependent: :destroy
  
#insertion des conditions de validité à l'entré d'un Gossip
  validates :title,
    presence: true,
    length: {minimum: 3, maximum: 14}
 

  validates :content,
    presence: true


end
