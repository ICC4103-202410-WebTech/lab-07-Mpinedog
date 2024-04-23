class Tag < ApplicationRecord
    has_many :post_tags
    has_many :books, through: :post_tags

    validates :name, presence: { message: "Provide a name for the tag." }, uniqueness: { message: "Esto ya existe sipo" }

end