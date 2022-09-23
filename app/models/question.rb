class Question < ApplicationRecord
  has_and_belongs_to_many :qcms
  has_and_belongs_to_many :categories
  has_many :reponses
  has_many :options
  enum :typedequestion, [ :multiple, :ouverte, :numerique ]

  def toTxt()
    txtofq = "* " + texte + "\n";
    reponses.each do |reponse|
      txtofq += (reponse.isRight ? txtofq += "+ " : txtofq += "- ") + reponse.texte + "\n"
    end
    txtofq
  end
end