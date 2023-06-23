class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  
    # Custom validator
    validate :clickbait
    def clickbait
        clickbait_words = %w(Won't Believe Secret Top Guess)
        if title && !clickbait_words.any? { |word| title.include?(word) }
            errors.add(:title, "must contain one of the following clickbait words: #{clickbait_words.join(', ')}")
        end
      end
      
  end
  