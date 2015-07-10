class Post < ActiveRecord::Base
  has_many :comments
  validates :title, presence: true, length: { in: 4..140 }

  validate :text_or_url

  has_many :post_upvotes, foreign_key: 'parent_id'

  private
  
  def text_or_url
    unless self.text || self.url
      return false
    end
  end
end
