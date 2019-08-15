class Blogger < ApplicationRecord
    
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: :true
    validates :age, numericality: {minimum: 1}
    validates :bio, length: {minimum: 30}

    def total_likes        
        like_array = self.posts.map do |post|
            if post.likes 
                post.likes
            else
                post.likes = 0
            end
        end
        like_array.sum
    end

    def most_liked_post
        posts_array = []
        
        self.posts do |post|
            posts_array << post.likes
        end

        posts_array.pop
    end
    
end