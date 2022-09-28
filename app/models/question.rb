class Question < ApplicationRecord
  has_and_belongs_to_many :qcms
  has_and_belongs_to_many :categories
  has_many :reponses
  has_many :options
  enum :typedequestion, [ :multiple, :ouverte, :numerique ]

  def toTxt()
    txtofq = "#{questionPrefix()}" + texte + "\n";
    reponses.each do |reponse|
      txtofq += (reponse.isRight ? "+" : "-") + "{#{reponse.points}} " + reponse.texte + "\n"
    end
    return txtofq
  end

  def questionPrefix()
    prefix = ""
    case typedequestion
      when "multiple"
        if getRightAnswerCount() > 1
          prefix = "**"
        else
          prefix = "*"
        end
      when "ouverte"
        prefix = "*<lines=4>"
      when "numerique"
    end
    prefix
  end

  def getRightAnswerCount()
    print("ANSWER COUNT : #{reponses.count {|reponse| reponse.isRight}}")
    reponses.count {|reponse| reponse.isRight}
  end
end