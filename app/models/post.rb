class Post < ActiveRecord::Base
  belongs_to :member
  has_many :comments

  acts_as_votable
  has_and_belongs_to_many :tags
  has_many :post_upvotes, foreign_key: 'parent_id'

  validates :title, presence: true, length: { in: 4..140 }
  validate :text_or_url

  def self.tagged_with(name)
    Tag.find_by_name!(name).posts
  end

  def tag_list
    self.tags.map {|t| t.name }.join(" ")
  end

  def tag_list=(tag_list)
    tags = tag_list.split(" ").map{|n| n.strip.downcase}
    tags.each do |tag_name|
      tag = Tag.find_or_create_by_name!(name: tag_name)
      tag.name = tag_name
      self.tags << tag
    end
  end



  private

  def text_or_url
    if self.text.empty? && self.url.empty?
      errors[:base] << "Post must have either text or a url"
      return false
    end
  end
end
