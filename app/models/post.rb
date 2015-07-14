class Post < ActiveRecord::Base
  belongs_to :member
  has_many :comments

  acts_as_votable
  has_and_belongs_to_many :tags
  has_many :post_upvotes, foreign_key: 'parent_id'

  validates :title, presence: true, length: { in: 4..140 }
  validate :text_or_url

  def tag_list
    self.tags.map {|t| t.name }.join(" ")
  end

  private

  def text_or_url
    if self.text.empty? && self.url.empty?
      errors[:base] << "Post must have either text or a url"
      return false
    end
  end
end
