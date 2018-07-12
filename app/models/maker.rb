class Maker < ActiveRecord::Base
    has_many :works
    
    validates(:name, 
        presence: true,
        length: {minimum: 2}
        )
    validates(:email, 
        presence: true,
        length: {minimum: 3},
        format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/ }
        )
    validates(:phone_number,
        presence: true,
        length: {minimum: 8}
        )
end
