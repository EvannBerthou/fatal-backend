class Option < ApplicationRecord
    belongs_to :question
    enum :typedoption, [ :nbdigits, :nblignes, :listespointsqouverte, :listenomsqouverte, :bareme, :points, :decimaux, :bonnereponse, :signe, :ptsmauvaisereponse, :coefficientmauvaisereponse ]
end
