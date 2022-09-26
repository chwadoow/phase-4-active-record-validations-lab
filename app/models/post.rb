class Post < ApplicationRecord
    validates :title , presence: true
    validates :content , length: {minimum: 250}
    validates :summary , length: {maximum: 250}
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
    validate :clickbait
   
  
    def clickbait
        unless ["You Won't Believe These True Facts", "Won't Believe","Secret","Top[number]","Guess"].include?(title)
        #unless ["Won't Believe","Secret","Top[number]","Guess"].any? {|word| title.include? (word)}
            errors.add(:title, "must be clickbait")
        end
    end
end



