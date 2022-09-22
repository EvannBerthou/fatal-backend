class Question < ApplicationRecord
  has_and_belongs_to_many :qcms
  has_many :reponses

  def toTxt()
    txtofq = "* " + texte + "\n";
    reponses.each do |reponse|
      reponse.isRight ? txtofq += "+ " : txtofq += "- "
      txtofq += reponse.texte + "\n"
    end
    txtofq
  end
end