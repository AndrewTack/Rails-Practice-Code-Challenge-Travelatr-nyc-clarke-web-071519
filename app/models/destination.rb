class Destination < ApplicationRecord

has_many :posts
has_many :bloggers, through: :posts

    def most_recent_posts
        self.posts.order(created_at).limit(5)
    end

    def most_liked_post
        posts_array = []
        
        self.posts do |post|
            post_array << post.likes
        end

        post_array.pop
    end

    def blogger_average_age
        ages_array = []

        self.posts do |post|
            ages_array << post.blogger.age 
        end

        ages_array.inject{ |sum, el| sum + el }.to_f / arr.size
    end

end