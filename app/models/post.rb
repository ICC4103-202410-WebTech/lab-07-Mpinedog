class Post < ApplicationRecord
    belongs_to :user
    has_many :post_tags
    has_many :tags, through: :post_tags
  
    validates :title, presence: { message: "Provide a title for your post." }
    validates :content, presence: { message: "Enter some content for your post." }
    validates :user_id, presence: { message: "User ID must be provided for the post." }
    validates :answers_count, numericality: { greater_than_or_equal_to: 0, message: "Answers count must be a non-negative number." }
    validates :likes_count, numericality: { greater_than_or_equal_to: 0, message: "Likes count must be a non-negative number." }
  
    before_validation :set_published_at_default, on: :create
  
    private
  
    def set_published_at_default
      self.published_at ||= Time.now
    end
  end
  