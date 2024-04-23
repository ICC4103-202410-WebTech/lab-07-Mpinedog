class User < ApplicationRecord
    has_many :posts

    validates :name, presence: { message: "Enter your name." }
    validates :email, presence: { message: "Enter your email address." },
                    uniqueness: { message: "This email address has already been used, prueba otra po." },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "Enter a valid email address po, ponte vio." }
    validates :password, presence: { message: "Please enter a password." }, 
                    length: { minimum: 6, message: "escribe una clave bien po minimo 6 caracteres." }
end