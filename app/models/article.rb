class Article < ActiveRecord::Base
  belongs_to :utilisateur

  validates :utilisateur_id, presence: true
  validates :titre, presence: true, length: {maximum: 200}
  validates :description, presence: true, length: {maximum: 2000}
end
