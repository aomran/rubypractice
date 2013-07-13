class Calculator
  def strip_irrelevant_words(phrase)
    phrase
    words = phrase.split[2..-1]
    words[words.length-1].gsub!("?","")
    words.map! do |word|
      word.downcase
    end
  end

  def convert_to_math_syntax(word_array)
    word_array.map! do |word|
      if word.match(/-?\d+/)
        word.to_f
      elsif word == "plus"
        word = :+
      elsif word == "minus"
        word = :-
      elsif word == "multiplied"
        word = :*
      elsif word == "divided"
        word = :/
      else
      end
    end

    word_array.reject { |word| word == nil}
  end

  def calculate(math_array)
    answer = math_array[0].send(math_array[1],math_array[2])

    if math_array.length > 3
      if (math_array[1] == :+ || math_array[1] == :-) && (math_array[3] == :* || math_array[3] == :/)
        answer = math_array[2].send(math_array[3],math_array[4])
        answer = math_array[0].send(math_array[1], answer)
      else
        answer = answer.send(math_array[3], math_array[4])
      end
    end
    answer
  end
end