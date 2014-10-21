class User < ActiveRecord::Base
    
     has_secure_password
    
    validates :name, presence:true
    validates :email, uniqueness:true
    validates :password, length:{minimum:6}
    validates :password_confirmation, presence:true
    
    def self.search(query)
        where("name like ?", "%#{query}%")
    end
    
end
