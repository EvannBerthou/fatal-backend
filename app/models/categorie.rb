class Categorie < ApplicationRecord
    belongs_to :qcm
    has_and_belongs_to_many :questions

    accepts_nested_attributes_for :questions
end
