class Option < ApplicationRecord
    belongs_to :question
    enum :typedoption, [ :nbdigits, :nblignes, :decimaux, :bonnereponse, :signe ]
end
