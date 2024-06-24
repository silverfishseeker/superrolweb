class Magicschool < ApplicationRecord
    # string: nombre
    has_and_belongs_to_many :spells
end
