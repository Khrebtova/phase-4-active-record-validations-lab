class Post < ApplicationRecord
   
    validates :title, presence: true 
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :title_is_clickbait?

    
    WORDS = [
        /Won't Believe/i,
        /Secret/i,
        /Top \d/i,
        /Guess/i
      ]
    
    def title_is_clickbait?        
        if WORDS.none?{|el| el.match title}
            errors.add(:title, "must include 'Won't Believe', 'Secret', 'Top', or 'Guess'")
        end
    end
    # def title_is_clickbait?        
    #     result = title.include?("Won't Believe") || title.include?("Secret") || title.include?("Top") || title.include?("Guess")
    #     if !result 
    #         errors.add(:title, "must include 'Won't Believe', 'Secret', 'Top', or 'Guess'")
    #     end
    # end
end
